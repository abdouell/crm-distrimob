import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface Prospect {
  id: number;
  name: string;
  activity_sector: string;
  city: string;
  phone: string;
  website: string | null;
  source: string;
  status: string;
  notes: string | null;
  created_at: string;
  owner_id: number;
  owner_name: string;
  last_interaction_at: string | null;
  contacts?: any[];
  interactions?: any[];
}

@Injectable({
  providedIn: 'root'
})
export class ProspectService {
  constructor(private http: HttpClient) {}

  getProspects(filters: { search?: string; status?: string; activity_sector?: string; ordering?: string }): Observable<Prospect[]> {
    let params = new HttpParams();
    if (filters.search) params = params.set('search', filters.search);
    if (filters.status) params = params.set('status', filters.status);
    if (filters.activity_sector) params = params.set('activity_sector', filters.activity_sector);
    if (filters.ordering) params = params.set('ordering', filters.ordering);

    return this.http.get<Prospect[]>('/api/prospects', { params });
  }

  getProspectById(id: number): Observable<Prospect> {
    return this.http.get<Prospect>(`/api/prospects/${id}`);
  }

  createProspect(prospect: Partial<Prospect>): Observable<Prospect> {
    return this.http.post<Prospect>('/api/prospects', prospect);
  }

  updateProspect(id: number, prospect: Partial<Prospect>): Observable<Prospect> {
    return this.http.put<Prospect>(`/api/prospects/${id}`, prospect);
  }

  deleteProspect(id: number): Observable<void> {
    return this.http.delete<void>(`/api/prospects/${id}`);
  }
}
