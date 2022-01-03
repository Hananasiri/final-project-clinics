# final-project-clinics

#Description :

Set of Dental clinics every clinic has a set of services that make the user choose name of the clinic Such as 
Dentera Dental Clinic, Pro Clinic Dental Clinic and other clinics and the type of service and book in it.

#User Stories :

As a new user , I want to register by name and email and password ,so that the system can remember me and my data.
As a registered user, I want to log in with my email and password, so that the system can authenticate me and I can trust it.
As a user, I want to choose the right dental clinic for me.
As a user, I want to book a dental.
As a user, I want to delete an appointment that I do not want.
As a user, I want to get medical advice.
As a user, I want to choose the right date for me.
As a user, I want to see the location of the clinics on the map
As a user, I want to complete my data registration.


# Backlog:
 
User :
- can signup/login
- see your profile
- see Clinics Book List
- see Appointments list
- see advice list
- can add appointment
- can delete appointment
- can see location of clinic



# React Router Routes (React App)
|      Component      |   Permission   |                                           Behavior                                                                       |
|---------------------|----------------|--------------------------------------------------------------------------------------------------------------------------|
|     lunchScreen     |     public     |                                        Show Logo                                                                         |                
|    RigesterPage     |     public     | Rigester page, link to login, navigate to homepage after Rigester.                                                       |              
|     LoginPage       |     public     | Login page, link to login,  navigate to home page after login.                                                           |
|    firstHomePage    |   user only    | Home page, link to clinics List, navigate to  clinics list after pressed on Dintera clinic lable.                        |
|    firstHomePage    |   user only    | Home page, link to clinics List, navigate to clinics List after pressed on Joya clinic lable.                            |
|    firstHomePage    |   user only    | Home page, link to clinics List, navigate to clinics List after pressed on Almadar clinic lable.                         |
|    firstHomePage    |   user only    | Home page, link to clinics List, navigate to clinics List after pressed on ProClinic lable.                              |
|  listClinicPage     |   user only    | list clinic page, link to clinic information, navigate to clinic information after pressed on specific clinic.           |
|informationClinicPage|   user only    | information clinic page, link to nameOfService , navigate to clinic page after pressed on nameOfService lable.           |
informationClinicPage |   user only    | information clinic page, link to nameOfDoctor , navigate to clinic page after pressed on nameOfDoctor lable.             |
|informationClinicPage|   user only    | information clinic page, link to timeOfService , navigate to clinic page after pressed on timeOfService lable.           |   
|   listClinicPage    |   user only    | list Clinic Page, link to add Clinic to appointment page, after pressed on pressed Button.                               |                
|   ClinicMapsPage    |   user only    | clinicMaps Page, link to clinicMaps Page, after pressed on clinicMaps Page.                                              |
|   AppointmentPage   |   user only    | Appointment page, link to  Appointments List, navigate to AppointmentList after pressed on nameOfService lable.          | 
|    profilePage      |   user only    | profile page, link to edit profile image, navigate to iphone library after tap on profile image.                         |
|    profilePage      |   user only    | profile page, link to edit User name, navigate to edite user name after tap on name field.                               |    
|    profilePage      |   user only    | profile page, link to edit User Address, navigate to edite user address after tap on address field.                      | 
|     profilePage     |   user only    | profile page, link to changeLanguage, navigate to changeLanguage after pressed on change button.                         |
|    profilePage      |   user only    | profile page, link to signOut, navigate to login page after pressed on SignOut button.                                   |
|



#Features List:

- The user can choose the appropriate time for him.
- The user has more than one clinic.
- The user can delete an appointment and add a new appointment.
- Accurately locate clinics map.

#Structure:

// Add your project screens/models/views/cells

 Models: clinic , Service , Advice.
 Controllers: ClinicVC , LoginVC , TabVC , ReservationVC , NewServiceVC , AdvicesVC , LocationVC.
 Clinics: ClinicVC , ClinicCell , DinteraClinic , JoyaClinic , AlmadarClinic , ProClinic.
 Services: ReservationsService.
 Models: ClinicCell  ,DinteraClinicCell,JoyaClinicCell,AlmadarClinicCell ,ProClinicCell,AdvicesCell.
 Tab bar: Clinics , ClinicsLocation, MedicalAdvice, MyAppointments , Profile.

#Components :

ProfilePage
LoginPage
ClinicsPage
MedicalAdvicesPage
MyAppointmentsPage
DinteraDentalPage
JoyaDentalPage
AlmadarDentalPage
ProClinicDentalPage



#Services :

 ReservationsService
- user.add Appointments
- user.delete Appointments


# repository Link:
 [click here](https://github.com/Hananasiri/final-project-clinics)
