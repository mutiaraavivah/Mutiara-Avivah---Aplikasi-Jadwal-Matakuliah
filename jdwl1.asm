.model small
.code
org 100h

   start:
    jmp mulai
    
    welcome        db 13,10,'         Selamat Datang di Jadwal Mata Kuliah $' 
    nama           db 13,10,''
                   db 13,10,'  Nama  : $'
    nim            db 13,10,'  NIM   : $'
    kelas          db 13,10,'  Kelas : $'             
    masukkan       db 13,10,''
                   db 13,10,' Masukkan Nomor Jadwal Mata Kuliah: $' 
    tampung_nama   db 30,?,30 dup(?)  
    tampung_nim    db 30,?,30 dup(?)
    tampung_hai    db 30,?,30 dup(?)
    tampung_kelas  db 30,?,30 dup(?)
    
    
jadwal db 13,10,''
       db 13,10,' +==========================================+'
       db 13,10,' |                                          |'
       db 13,10,' |***         JADWAL MATA KULIAH         ***|' 
       db 13,10,' |                                          |'
       db 13,10,' |==========================================|'
       db 13,10,' |    |              |    |                 |'
       db 13,10,' | NO |     HARI     | NO |     HARI        |'
       db 13,10,' |____|______________|____|_________________|'          
       db 13,10,' |    |              |    |                 |'
       db 13,10,' | 1. |     SENIN    | 5. |     JUMAT       |'
       db 13,10,' |____|______________|____|_________________|' 
       db 13,10,' |    |              |    |                 |'
       db 13,10,' | 2. |     SELASA   | 6. |     SABTU       |'
       db 13,10,' |____|______________|____|_________________|'
       db 13,10,' |    |              |    |                 |'
       db 13,10,' | 3. |     RABU     | 7. |     MINGGU      |'
       db 13,10,' |____|______________|____|_________________|'
       db 13,10,' |    |                                     |'
       db 13,10,' | 4. |     KAMIS                           |'
       db 13,10,' |____|_____________________________________|','$'  

    
mulai:
    mov ah,09h
    lea dx,welcome
    int 21h          
    mov ah,0ah
    lea dx,tampung_hai
    int 21h
    push dx
    
    mov ah,09h
    lea dx,nama
    int 21h          
    mov ah,0ah
    lea dx,tampung_nama
    int 21h
    push dx 
    
    mov ah,09h
    lea dx,nim
    int 21h          
    mov ah,0ah
    lea dx,tampung_nim
    int 21h
    push dx     
    
    mov ah,09h
    lea dx,kelas
    int 21h          
    mov ah,0ah
    lea dx,tampung_kelas
    int 21h
    push dx
        
    mov ah,09h
    mov dx,offset jadwal
    int 21h
    mov ah,09h
    jmp proses
    jne error_msg
        
error_msg:
    mov ah,09h
    mov dx,offset error_msg
    int 21h
    int 20h 
    
proses:
    mov ah,09h
    mov dx,offset masukkan
    int 21h
    mov ah,01
    int 21h
    mov bh,al
        
    cmp al,'1'
    je hasil1
        
    cmp al,'2'
    je hasil2
        
    cmp al,'3'
    je hasil3  
        
    cmp al,'4'
     je hasil4
        
    cmp al,'5'
    je hasil5
        
    cmp al,'6'
    je hasil6
        
    cmp al,'7'
    je hasil7
        
hasil1:
    mov ah,09h
    lea dx,hari1
    int 21h
    int 20h
hasil2:
	mov ah,09h
	lea dx,hari2
	int 21h
	int 20h
hasil3:
	mov ah,09h
	lea dx,hari3
	int 21h
	int 20h
hasil4:
    mov ah,09h
    lea dx,hari4
    int 21h
    int 20h
hasil5:
	mov ah,09h
	lea dx,hari5
	int 21h
	int 20h
hasil6:
	mov ah,09h
	lea dx,hari6
	int 21h
	int 20h  
hasil7:
    mov ah,09h
    lea dx,hari7
    int 21h
    int 20h  
    
;+===================================================================+


hari1 db 13,10,''
      db 13,10,' +=========================================+'                                                   
      db 13,10,' |                 Senin                   |'
      db 13,10,' |-----------------------------------------|'                           
      db 13,10,' | Logika Informatika                      |'                                
      db 13,10,' | Dosen   : Jihad Rahmawan, S.T., M.Sc     |'              
      db 13,10,' | Jam     : 10:30 - 12:10                  |'                           
      db 13,10,' | Ruangan : 4.1.5.71                       |'                                
      db 13,10,' |                                         |'                      
      db 13,10,' | Manajemen Data dan Informasi            |'                      
      db 13,10,' | Dosen   : Ninda Khoirunnisa, S.T., M.Sc  |'           
      db 13,10,' | Jam     : 12:30 - 15:05                  |'                           
      db 13,10,' | Ruangan : 4.1.7.79                       |' 
      db 13,10,' +=========================================+','$'                             
                                                                   
hari2 db 13,10,''
      db 13,10,' +===============================================+'                                                  
      db 13,10,' |                  Selasa                       |'
      db 13,10,' |-----------------------------------------------|'                         
      db 13,10,' | Kalkulus Informatika                          |'                      
      db 13,10,' | Dosen   : Andri Pranolo, S.Kom., M.Cs., Ph.D.  |'
      db 13,10,' | Jam     : 12:30 - 15:05                        |' 
      db 13,10,' | Ruangan : 4.1.5.71                             |' 
      db 13,10,' +===============================================+','$' 
      
hari3 db 13,10,''
      db 13,10,' +====================================+'
      db 13,10,' |              Rabu                  |'
      db 13,10,' |------------------------------------|'
      db 13,10,' | Dasar Sistem Komputer              |'
      db 13,10,' | Dosen   : Ali Tarmuji, S.T., M.Cs.  |'
      db 13,10,' | Jam     : 07:00 - 08:40             |' 
      db 13,10,' | Ruangan : 4.1.4.49                  |'
      db 13,10,' +====================================+','$' 
      
hari4 db 13,10,''   
      db 13,10,' +=====================================+'
      db 13,10,' |               Kamis                 |' 
      db 13,10,' |-------------------------------------|'
      db 13,10,' | Pancasila                           |'
      db 13,10,' | Dosen   : Dr. Sobirin, S.H., M.Hum.  |'
      db 13,10,' | Jam     : 08:45 - 10:25              |' 
      db 13,10,' | Ruangan : Daring                     |'
      db 13,10,' +=====================================+','$' 
      
hari5 db 13,10,''  
      db 13,10,' +======================================+'
      db 13,10,' |               Jumat                  |'              
      db 13,10,' |--------------------------------------|'
      db 13,10,' | Dasar Pemrograman                    |'               
      db 13,10,' | Dosen   : Bambang Robiin, S.T., M.T.  |'
      db 13,10,' | Jam     : 12:30 - 15:05               |' 
      db 13,10,' | Ruangan : 4.1.8.82                    |' 
      db 13,10,' +======================================+','$'
      
hari6 db 13,10,''                  
      db 13,10,' +==========================================+'
      db 13,10,' |                 Sabtu                    |' 
      db 13,10,' |------------------------------------------|'
      db 13,10,' | Al-Quran dan Hadits                      |'
      db 13,10,' | Dosen   : Muh Fatkul Mubin, S.Ag., M.Pd.  |'
      db 13,10,' | Jam     : 10:30 - 12:10                   |' 
      db 13,10,' | Ruangan : 4.1.5.59                        |'
      db 13,10,' +==========================================+','$' 
      
hari7 db 13,10,''
      db 13,10,' +=========================+'
      db 13,10,' |         Minggu          |'
      db 13,10,' |-------------------------|'
      db 13,10,' |                         |'
      db 13,10,' |    HAPPY WEEKEND!!!     |'
      db 13,10,' |                         |'
      db 13,10,' +=========================+','$'
ret  


;+===================================================================+            