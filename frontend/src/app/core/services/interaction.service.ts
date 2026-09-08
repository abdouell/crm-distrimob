import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface Interaction {
  id: number;
  prospect: number;
  date: string;
  type: string;
  notes: string;
  contact_id?: number | null;
  contact_name?: string | null;
}

@Injectable({
  providedIn: 'root'
})
export class InteractionService {
  constructor(private http: HttpClient) {}

  createInteraction(interaction: Partial<Interaction>): Observable<Interaction> {
    return this.http.post<Interaction>('/api/interactions', interaction);
  }

  updateInteraction(id: number, interaction: Partial<Interaction>): Observable<Interaction> {
    return this.http.put<Interaction>(`/api/interactions/${id}`, interaction);
  }

  deleteInteraction(id: number): Observable<void> {
    return this.http.delete<void>(`/api/interactions/${id}`);
  }
}
