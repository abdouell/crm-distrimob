import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { ProspectService, Prospect } from '../../core/services/prospect.service';
import { ContactService, Contact } from '../../core/services/contact.service';
import { InteractionService, Interaction } from '../../core/services/interaction.service';

interface Toast {
  message: string;
  type: 'success' | 'error' | 'info';
}

@Component({
  selector: 'app-prospect-detail',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './prospect-detail.component.html'
})
export class ProspectDetailComponent implements OnInit {
  prospectId!: number;
  prospect: Prospect | null = null;

  // Modals visibility
  showProspectModal = false;
  showContactModal = false;
  showInteractionModal = false;

  // Form bindings
  prospectForm: Partial<Prospect> = {};
  
  editingContact: Contact | null = null;
  contactForm: Partial<Contact> = {};

  editingInteraction: Interaction | null = null;
  interactionForm: Partial<Interaction> = {};

  // Toasts
  toasts: Toast[] = [];

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private prospectService: ProspectService,
    private contactService: ContactService,
    private interactionService: InteractionService
  ) {}

  ngOnInit(): void {
    const idParam = this.route.snapshot.paramMap.get('id');
    if (idParam) {
      this.prospectId = +idParam;
      this.loadProspect();
    } else {
      this.router.navigate(['/dashboard']);
    }
  }

  loadProspect(): void {
    this.prospectService.getProspectById(this.prospectId).subscribe({
      next: (data) => {
        this.prospect = data;
      },
      error: () => {
        this.showToast('Impossible de charger les détails de ce prospect.', 'error');
        this.router.navigate(['/dashboard']);
      }
    });
  }

  get sortedInteractions(): any[] {
    if (!this.prospect || !this.prospect.interactions) return [];
    return [...this.prospect.interactions].sort(
      (a, b) => new Date(b.date).getTime() - new Date(a.date).getTime()
    );
  }

  getStatusClass(status: string): string {
    return status.replace(' ', '-');
  }

  formatDate(dateString: string): string {
    if (!dateString) return '-';
    return new Date(dateString).toLocaleDateString('fr-FR');
  }

  formatDateTime(dateString: string): string {
    if (!dateString) return '-';
    return new Date(dateString).toLocaleString('fr-FR', {
      day: '2-digit',
      month: 'short',
      year: 'numeric',
      hour: '2-digit',
      minute: '2-digit'
    });
  }

  getInteractionIcon(type: string): string {
    const icons: { [key: string]: string } = {
      'appel': 'fa-phone',
      'email': 'fa-envelope',
      'WhatsApp': 'fa-whatsapp',
      'RDV': 'fa-handshake',
      'démo': 'fa-desktop',
      'visite': 'fa-map-pin',
      'LinkedIn': 'fa-linkedin'
    };
    return 'fa-solid ' + (icons[type] || 'fa-comment');
  }

  goBack(): void {
    this.router.navigate(['/dashboard']);
  }

  // Prospect modification & deletion
  openProspectModal(): void {
    if (this.prospect) {
      this.prospectForm = { ...this.prospect };
      this.showProspectModal = true;
    }
  }

  closeProspectModal(): void {
    this.showProspectModal = false;
    this.prospectForm = {};
  }

  saveProspect(): void {
    if (!this.prospectForm.name || !this.prospectForm.activity_sector || !this.prospectForm.city || !this.prospectForm.phone || !this.prospectForm.source) {
      this.showToast('Veuillez remplir tous les champs obligatoires (*).', 'error');
      return;
    }

    this.prospectService.updateProspect(this.prospectId, this.prospectForm).subscribe({
      next: () => {
        this.showToast('Prospect mis à jour avec succès.', 'success');
        this.closeProspectModal();
        this.loadProspect();
      },
      error: (err) => {
        const msg = err.error?.message || (err.error?.errors && err.error.errors[0]?.defaultMessage) || 'Erreur lors de la mise à jour.';
        this.showToast(msg, 'error');
      }
    });
  }

  deleteProspect(): void {
    if (confirm('Êtes-vous sûr de vouloir supprimer ce prospect définitivement ?')) {
      this.prospectService.deleteProspect(this.prospectId).subscribe({
        next: () => {
          this.showToast('Prospect supprimé avec succès.', 'success');
          this.router.navigate(['/dashboard']);
        },
        error: () => {
          this.showToast('Erreur lors de la suppression.', 'error');
        }
      });
    }
  }

  // Contacts CRUD
  openContactModal(contact: Contact | null = null): void {
    if (contact) {
      this.editingContact = contact;
      this.contactForm = { ...contact };
    } else {
      this.editingContact = null;
      this.contactForm = {
        prospect: this.prospectId,
        first_name: '',
        last_name: '',
        job_title: '',
        email: '',
        phone: '',
        linkedin_url: '',
        notes: ''
      };
    }
    this.showContactModal = true;
  }

  closeContactModal(): void {
    this.showContactModal = false;
    this.contactForm = {};
    this.editingContact = null;
  }

  saveContact(): void {
    if (!this.contactForm.first_name || !this.contactForm.last_name || !this.contactForm.job_title || !this.contactForm.email || !this.contactForm.phone) {
      this.showToast('Veuillez remplir tous les champs obligatoires (*).', 'error');
      return;
    }

    if (this.editingContact) {
      this.contactService.updateContact(this.editingContact.id, this.contactForm).subscribe({
        next: () => {
          this.showToast('Contact mis à jour avec succès.', 'success');
          this.closeContactModal();
          this.loadProspect();
        },
        error: (err) => {
          const msg = err.error?.message || (err.error?.errors && err.error.errors[0]?.defaultMessage) || 'Erreur de modification.';
          this.showToast(msg, 'error');
        }
      });
    } else {
      this.contactService.createContact(this.contactForm).subscribe({
        next: () => {
          this.showToast('Contact créé avec succès.', 'success');
          this.closeContactModal();
          this.loadProspect();
        },
        error: (err) => {
          const msg = err.error?.message || (err.error?.errors && err.error.errors[0]?.defaultMessage) || 'Erreur de création.';
          this.showToast(msg, 'error');
        }
      });
    }
  }

  deleteContact(contactId: number): void {
    if (confirm('Supprimer ce contact ?')) {
      this.contactService.deleteContact(contactId).subscribe({
        next: () => {
          this.showToast('Contact supprimé.', 'success');
          this.loadProspect();
        },
        error: () => {
          this.showToast('Erreur de suppression.', 'error');
        }
      });
    }
  }

  // Interactions CRUD
  openInteractionModal(interaction: Interaction | null = null): void {
    if (interaction) {
      this.editingInteraction = interaction;
      // Convert UTC date to local string for datetime-local input
      const localDate = new Date(interaction.date);
      const year = localDate.getFullYear();
      const month = String(localDate.getMonth() + 1).padStart(2, '0');
      const day = String(localDate.getDate()).padStart(2, '0');
      const hours = String(localDate.getHours()).padStart(2, '0');
      const minutes = String(localDate.getMinutes()).padStart(2, '0');
      
      this.interactionForm = {
        ...interaction,
        date: `${year}-${month}-${day}T${hours}:${minutes}`,
        contact_id: interaction.contact_id != null ? +interaction.contact_id : null
      };
    } else {
      this.editingInteraction = null;
      // Pre-fill with current local datetime
      const now = new Date();
      const year = now.getFullYear();
      const month = String(now.getMonth() + 1).padStart(2, '0');
      const day = String(now.getDate()).padStart(2, '0');
      const hours = String(now.getHours()).padStart(2, '0');
      const minutes = String(now.getMinutes()).padStart(2, '0');

      this.interactionForm = {
        prospect: this.prospectId,
        date: `${year}-${month}-${day}T${hours}:${minutes}`,
        type: '',
        notes: '',
        contact_id: null
      };
    }
    this.showInteractionModal = true;
  }

  closeInteractionModal(): void {
    this.showInteractionModal = false;
    this.interactionForm = {};
    this.editingInteraction = null;
  }

  saveInteraction(): void {
    if (!this.interactionForm.type) {
      this.showToast('Veuillez sélectionner un type d\'échange (*).', 'error');
      return;
    }
    if (!this.interactionForm.date) {
      this.showToast('Veuillez renseigner la date de l\'échange (*).', 'error');
      return;
    }
    if (!this.interactionForm.notes || !this.interactionForm.notes.trim()) {
      this.showToast('Veuillez saisir un compte-rendu ou une note (*).', 'error');
      return;
    }

    // Parse the datetime local value back to ISO string
    const parsedDate = new Date(this.interactionForm.date).toISOString();
    const contactId = this.interactionForm.contact_id ? +this.interactionForm.contact_id : null;
    const payload = { ...this.interactionForm, date: parsedDate, contact_id: contactId };

    if (this.editingInteraction) {
      this.interactionService.updateInteraction(this.editingInteraction.id, payload).subscribe({
        next: () => {
          this.showToast('Échange mis à jour avec succès.', 'success');
          this.closeInteractionModal();
          this.loadProspect();
        },
        error: (err) => {
          const msg = err.error?.message || (err.error?.errors && err.error.errors[0]?.defaultMessage) || 'Erreur de modification.';
          this.showToast(msg, 'error');
        }
      });
    } else {
      this.interactionService.createInteraction(payload).subscribe({
        next: () => {
          this.showToast('Échange consigné avec succès.', 'success');
          this.closeInteractionModal();
          this.loadProspect();
        },
        error: (err) => {
          const msg = err.error?.message || (err.error?.errors && err.error.errors[0]?.defaultMessage) || 'Erreur d\'enregistrement.';
          this.showToast(msg, 'error');
        }
      });
    }
  }

  deleteInteraction(interactionId: number): void {
    if (confirm('Supprimer cet échange de l\'historique ?')) {
      this.interactionService.deleteInteraction(interactionId).subscribe({
        next: () => {
          this.showToast('Échange supprimé.', 'success');
          this.loadProspect();
        },
        error: () => {
          this.showToast('Erreur de suppression.', 'error');
        }
      });
    }
  }

  // Toasts
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
