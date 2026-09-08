import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface Contact {
  id: number;
  prospect: number;
  first_name: string;
  last_name: string;
  job_title: string;
  email: string;
  phone: string;
  linkedin_url: string | null;
  notes: string | null;
}

@Injectable({
  providedIn: 'root'
})
export class ContactService {
  constructor(private http: HttpClient) {}

  createContact(contact: Partial<Contact>): Observable<Contact> {
    return this.http.post<Contact>('/api/contacts', contact);
  }

  updateContact(id: number, contact: Partial<Contact>): Observable<Contact> {
    return this.http.put<Contact>(`/api/contacts/${id}`, contact);
  }

  deleteContact(id: number): Observable<void> {
    return this.http.delete<void>(`/api/contacts/${id}`);
  }
}
