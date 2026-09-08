import { Component, OnInit, OnDestroy } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Router, NavigationEnd } from '@angular/router';
import { AuthService, User } from '../../../core/services/auth.service';
import { Subscription } from 'rxjs';
import { filter } from 'rxjs/operators';

@Component({
  selector: 'app-sidebar',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './sidebar.component.html'
})
export class SidebarComponent implements OnInit, OnDestroy {
  user: User | null = null;
  activeRoute = '';
  private sub = new Subscription();

  constructor(private authService: AuthService, private router: Router) {
    this.activeRoute = this.router.url;
  }

  ngOnInit(): void {
    this.sub.add(
      this.authService.currentUser$.subscribe(user => {
        this.user = user;
      })
    );

    this.sub.add(
      this.router.events.pipe(
        filter(event => event instanceof NavigationEnd)
      ).subscribe((event: any) => {
        this.activeRoute = event.urlAfterRedirects || event.url;
      })
    );
  }

  ngOnDestroy(): void {
    this.sub.unsubscribe();
  }

  getInitials(): string {
    if (!this.user || !this.user.full_name) return 'AD';
    return this.user.full_name
      .split(' ')
      .map(n => n[0])
      .join('')
      .toUpperCase()
      .substring(0, 2);
  }

  navigateTo(path: string): void {
    this.router.navigate([path]);
  }

  logout(): void {
    this.authService.logout();
    this.router.navigate(['/login']);
  }
}
