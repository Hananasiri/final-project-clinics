# final-project-clinics
Description :

Clinics application , every clinic has a set of services that make the user choose the name
 of the clinic and the type of service and book in it.

User Stories :

As a new user , I want to register by name and email and password ,so that the system can remember me and my data.
As a registered user, I want to log in with my email and password, so that the system can authenticate me and I can trust it.
As a user, I want to choose the right dental clinic for me.
As a user, I want to book a dental.
As a user, I want to delete an appointment that I do not want.
As a user, I want to choose the right date for me.
As a user, I want to see the location of the clinics on the map
As a user, I want to complete my data registration.
As a user, I want to get medical advice.

Structure:

// Add your project screens/models/views/cells
 Models: clinic , Service , Advice
 Controllers: ClinicVC , LoginVC , TabVC , ReservationVC , NewServiceVC , AdvicesVC , Location
 Clinics: ClinicVC , ClinicCell , DinteraClinic , JoyaClinic , AlmadarClinic , ProClinic
 Services: ReservationsService
 Models: ClinicCell  ,DinteraClinicCell,JoyaClinicCell,AlmadarClinicCell ,ProClinicCell,AdvicesCell , 
 Tab bar: Clinics , ClinicsLocation, MedicalAdvice, MyAppointments , Profile

Components :

ProfilePage
LoginPage
ClinicsPage
MedicalAdvicesPage
MyAppointmentsPage
DinteraDentalPage
JoyaDentalPage
AlmadarDentalPage
ProClinicDentalPage



Services :
 ReservationsService

