import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { ProspectService, Prospect } from '../../core/services/prospect.service';

interface Toast {
  message: string;
  type: 'success' | 'error' | 'info';
}

@Component({
  selector: 'app-dashboard',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './dashboard.component.html'
})
export class DashboardComponent implements OnInit {
  prospects: Prospect[] = [];
  loading = false;
  
  // Filters
  filters = {
    search: '',
    status: '',
    activity_sector: '',
    ordering: '-created_at'
  };

  // Stats
  stats = {
    total: 0,
    active: 0,
    signed: 0,
    forgotten: 0
  };

  // Pagination (cote client : les stats sont calculees sur la liste complete,
  // paginer cote serveur les fausserait)
  currentPage = 1;
  pageSize = 10;
  readonly pageSizeOptions = [10, 25, 50, 100];

  // Modal State & Form
  showModal = false;
  editingProspect: Prospect | null = null;
  prospectForm: Partial<Prospect> = this.resetProspectForm();

  // Toast notifications
  toasts: Toast[] = [];

  constructor(private prospectService: ProspectService, private router: Router) {}

  ngOnInit(): void {
    this.fetchProspects();
  }

  fetchProspects(): void {
    this.loading = true;
    this.prospectService.getProspects(this.filters).subscribe({
      next: (data) => {
        this.prospects = data;
        this.calculateStats(data);
        this.clampPage();
        this.loading = false;
      },
      error: (err) => {
        this.showToast('Impossible de charger les prospects.', 'error');
        this.loading = false;
      }
    });
  }

  calculateStats(prospectsList: Prospect[]): void {
    this.stats.total = prospectsList.length;
    
    // Prospects en cours de discussion (tout sauf 'nouveau', 'client signé' et 'perdu')
    this.stats.active = prospectsList.filter(
      p => !['nouveau', 'client signé', 'perdu'].includes(p.status)
    ).length;

    this.stats.signed = prospectsList.filter(p => p.status === 'client signé').length;

    // Prospects oubliés: pas d'interaction, ou dernière interaction > 30 jours
    const limitDate = new Date();
    limitDate.setDate(limitDate.getDate() - 30);
    this.stats.forgotten = prospectsList.filter(p => {
      if (!p.last_interaction_at) return true;
      return new Date(p.last_interaction_at) < limitDate;
    }).length;
  }

  onFilterChange(): void {
    this.currentPage = 1;      // un nouveau filtre repart de la premiere page
    this.fetchProspects();
  }

  // ---------- Pagination ----------
  get totalPages(): number {
    return Math.max(1, Math.ceil(this.prospects.length / this.pageSize));
  }

  get pagedProspects(): Prospect[] {
    const start = (this.currentPage - 1) * this.pageSize;
    return this.prospects.slice(start, start + this.pageSize);
  }

  get rangeStart(): number {
    return this.prospects.length === 0 ? 0 : (this.currentPage - 1) * this.pageSize + 1;
  }

  get rangeEnd(): number {
    return Math.min(this.currentPage * this.pageSize, this.prospects.length);
  }

  /** Fenetre de 5 numeros max, centree sur la page courante. */
  get pageNumbers(): number[] {
    const total = this.totalPages;
    let first = Math.max(1, this.currentPage - 2);
    const last = Math.min(total, first + 4);
    first = Math.max(1, last - 4);
    return Array.from({ length: last - first + 1 }, (_, i) => first + i);
  }

  goToPage(page: number): void {
    if (page < 1 || page > this.totalPages || page === this.currentPage) return;
    this.currentPage = page;
  }

  onPageSizeChange(): void {
    this.pageSize = Number(this.pageSize);
    this.currentPage = 1;
  }

  /** Apres suppression ou filtrage, la page courante peut ne plus exister. */
  private clampPage(): void {
    if (this.currentPage > this.totalPages) {
      this.currentPage = this.totalPages;
    }
  }

  getStatusClass(status: string): string {
    return status.replace(' ', '-');
  }

  formatDate(dateString: string | null): string {
    if (!dateString) return 'Jamais contacté';
    const d = new Date(dateString);
    return d.toLocaleDateString('fr-FR', {
      day: '2-digit',
      month: 'short',
      year: 'numeric'
    });
  }

  viewDetails(id: number): void {
    this.router.navigate(['/prospect', id]);
  }

  // Modals management
  openProspectModal(prospect: Prospect | null = null): void {
    if (prospect) {
      this.editingProspect = prospect;
      this.prospectForm = { ...prospect };
    } else {
      this.editingProspect = null;
      this.prospectForm = this.resetProspectForm();
    }
    this.showModal = true;
  }

  closeProspectModal(): void {
    this.showModal = false;
    this.prospectForm = this.resetProspectForm();
    this.editingProspect = null;
  }

  resetProspectForm(): Partial<Prospect> {
    return {
      name: '',
      activity_sector: '',
      city: '',
      phone: '',
      website: '',
      linkedin_url: '',
      source: '',
      status: 'nouveau',
      notes: ''
    };
  }

  saveProspect(): void {
    if (!this.prospectForm.name || !this.prospectForm.activity_sector || !this.prospectForm.city || !this.prospectForm.source) {
      this.showToast('Veuillez remplir tous les champs obligatoires (*).', 'error');
      return;
    }

    if (this.editingProspect) {
      // Update
      this.prospectService.updateProspect(this.editingProspect.id, this.prospectForm).subscribe({
        next: () => {
          this.showToast('Prospect mis à jour avec succès.', 'success');
          this.closeProspectModal();
          this.fetchProspects();
        },
        error: (err) => {
          const msg = err.error?.message || (err.error?.errors && err.error.errors[0]?.defaultMessage) || 'Erreur lors de la mise à jour.';
          this.showToast(msg, 'error');
        }
      });
    } else {
      // Create
      this.prospectService.createProspect(this.prospectForm).subscribe({
        next: () => {
          this.showToast('Prospect enregistré avec succès.', 'success');
          this.closeProspectModal();
          this.fetchProspects();
        },
        error: (err) => {
          const msg = err.error?.message || (err.error?.errors && err.error.errors[0]?.defaultMessage) || "Erreur lors de l'enregistrement.";
          this.showToast(msg, 'error');
        }
      });
    }
  }

  deleteProspect(id: number): void {
    if (!confirm('Êtes-vous sûr de vouloir supprimer ce prospect définitivement ? Cela effacera également tous ses contacts et interactions.')) {
      return;
    }

    this.prospectService.deleteProspect(id).subscribe({
      next: () => {
        this.showToast('Prospect supprimé avec succès.', 'success');
        this.fetchProspects();
      },
      error: () => {
        this.showToast('Erreur lors de la suppression.', 'error');
      }
    });
  }

  // Toasts management
  showToast(message: string, type: 'success' | 'error' | 'info' = 'success'): void {
    const toast: Toast = { message, type };
    this.toasts.push(toast);
    setTimeout(() => {
      this.toasts = this.toasts.filter(t => t !== toast);
    }, 4000);
  }

  getToastIcon(type: 'success' | 'error' | 'info'): string {
    if (type === 'success') return 'fa-check-circle';
    if (type === 'error') return 'fa-circle-exclamation';
    return 'fa-info-circle';
  }
}
