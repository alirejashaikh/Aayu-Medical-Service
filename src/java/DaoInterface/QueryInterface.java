package DaoInterface;

public interface QueryInterface {
    
// HOME PAGE

String notice1 = "select notice from notice as n1 order by notice_id DESC LIMIT 0,1"; 

String notice2 = "select notice from notice as n2 order by notice_id DESC LIMIT 1,1";

String ANNOUNCEMENT1 = "select ANNOUNCEMENT from ANNOUNCEMENT as A1 order by ANNOUNCEMENT_id DESC LIMIT 0,1"; 

String ANNOUNCEMENT2 = "select ANNOUNCEMENT from ANNOUNCEMENT as A2 order by ANNOUNCEMENT_id DESC LIMIT 1,1";

String feedback = "insert into contact_us (full_name, email_id, mob_number,rating) values (?,?,?,?)";

// transfer related

String all_doctor_list = "select * from doctor";

String all_nurse_list = "select * from nurse";

String random_hospital_to_transfer ="select hospital_id,hospital_name from hospital  where hospital_id !=? order by RAND() LIMIT 1";

String update_hospital_id_transfer_for_doctor = "UPDATE doctor SET new_hospital_id = ?, TRANSFER_STATUS = 'NO RESPONSE' where employee_id=?";

String update_hospital_id_transfer_for_nurse = "UPDATE nurse SET new_hospital_id = ?, new_shift = ?, TRANSFER_STATUS = 'NO RESPONSE' where employee_id = ?";

String fetch_random_shift = "select shift from shift order by RAND() LIMIT 1" ;

// opd related

String all_opd_details_with_employee_id = "select * from opd where employee_id=?";

String insert_into_opd = "INSERT INTO `aayu`.`opd` (`hospital_id`, `department_id`, `employee_id`, `day_1`, `time_1`, `total_slot_1`, `day_2`, `time_2`, `total_slot_2`, `day_3`, `time_3`, `total_slot_3` ) VALUES (?, (select department_id from department where department_name=?), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

String all_opd_booking_details_with_employee_id = "select * from opd_booking where employee_id=?";

// BED STATUS

String Bed_status_bangur = "SELECT SUM(available_bed) as medical_bed FROM ward WHERE hospital_id='2021901'";

String Bed_status_sskm = "SELECT SUM(available_bed) as medical_bed FROM ward WHERE hospital_id='2021902'";

String Bed_status_nrs = "SELECT SUM(available_bed) as medical_bed FROM ward WHERE hospital_id='2021903'";

String Bed_status_medical = "SELECT SUM(available_bed) as medical_bed FROM ward WHERE hospital_id='2021904'";

String Bed_status_rgkar = "SELECT SUM(available_bed) as medical_bed FROM ward WHERE hospital_id='2021905'";
    
//    REGISTER PAGE
    
String RegisterQuery = "insert into user_sign_up (first_name, middle_name, last_name, Gender, Blood_Group, Mob_Number, Alternative_mob_Number, email_id, password,dob) values (?,?,?,?,?,?,?,?,?,?);";

String Loginadd = "insert into log_in(username,password,role) values (?,?,'patient')";

// LOGIN PAGE

String LoginSQL = "select role,username from log_in where username = ? and password = ?";

                                                //ADMIN

// ADD NOTICE

String Publish_Notice = "insert into notice(notice) values (?)";

//ADD ANNOUNCEMENT

String Publish_Announcement = "insert into announcement(announcement) values (?)";

// ADD EMPLOYEE

String AddDoctorQuery = "INSERT INTO doctor(doctor_name,specialization,qualification,mob_number,email_id,username,password,employee_id,hospital_id) VALUES(?,?,?,?,?,?,?,(select employee_id from employee order by employee_id desc limit 0,1),?) ";

String AddEmployeeDoctor = "insert into employee(job_role) values ('doctor')";

String DoctorLoginadd = "insert into log_in(username,password,role) values (?,?,'doctor')";

String AddNurseQuery = "INSERT INTO nurse(name,ward_no,shift,email_id,mobile_no,username,password,employee_id) VALUES(?,?,?,?,?,?,?,(select employee_id from employee order by employee_id desc limit 0,1))" ;

String AddEmployeeNurse = "insert into employee(job_role) values ('nurse')";

String NurseLoginadd = "insert into log_in(username,password,role) values (?,?,'nurse')";

// REMOVE EMPLOYEE

String Fetch_Nurse_Employee_ID = "select employee_id from employee where job_role = 'nurse'";

String Fetch_Doctor_Employee_ID = "select employee_id from employee where job_role = 'doctor'";

String RemoveDoctorFromLogin ="delete from log_in where username=( select username from doctor where employee_id=?)";

String RemoveDoctorFromDoctor ="delete from doctor where employee_id=?";

String RemoveDoctorFromEmployee ="delete from employee where employee_id=?";

String RemoveNurseFromLogin ="delete from log_in where username=( select username from nurse where employee_id=?)";

String RemoveNurseFromNurse ="delete from nurse where employee_id=?";

String RemoveNurseFromEmployee ="delete from employee where employee_id=?";
 
// VIEW PATIENT

String fetch_hospital_list = "select hospital_id, hospital_name from hospital";

String fetch_department_list = "select * from department";

String fetch_patient_list_by_hospital = "select * from user_sign_up where employee_id_1 in (select employee_id from doctor where specialization = (select department_name from department where department_id =? and hospital_id=?)) or employee_id_2 in (select employee_id from doctor where specialization = (select department_name from department where department_id =? and hospital_id=?))"; 

// VIEW EMPLOYEE

String fetch_employee_list = "select * from employee where job_role ='doctor' or job_role ='nurse' order by job_role";

String job_role ="select job_role from employee where employee_id = ?";

String fetch_doctor_details = "select * from doctor where employee_id = ? ";

String fetch_hospital_name_with_doctor_emp_id = "select hospital_name from hospital where hospital_id = (select hospital_id from doctor where employee_id=?)";

String fetch_patient_list = "select first_name, middle_name, last_name, ward_no, bed_no from user_sign_up where employee_id_1=? or employee_id_2=?";   
 
String fetch_nurse_details = "select * from nurse where employee_id = ? ";

String fetch_hospital_name = "select hospital_name from hospital where hospital_id = (select hospital_id from ward where ward_no in (select ward_no from nurse where employee_id=?)) "; 

// EMPLOYEE TRANSFER REQUEST

String fetch_transfer_request = "select * from transfer where approval='PENDING'";

String fetch_role_with_emp_id = "select job_role from employee where employee_id=?";

String transfer_request_approval ="update transfer set approval=?, remarks=? WHERE EMPLOYEE_ID=?";

String transfer_to_new_hospital = "update DOCTOR set hospital_id=? where employee_id=?";

//PATIENT TRANSFER REQUEST

String fetch_all_patient_transfer_request = "select * from patient_transfer where status='NO RESPONSE'";

String fetch_patient_details_with_patient_id = "select * from user_sign_up where patient_id=?";

String fetch_remaining_hospitals ="select * from hospital where hospital_id != (select hospital_id from ward where ward_no=(select ward_no from user_sign_up where patient_id=?))";

String check_available_bed_hospital = "SELECT SUM(available_bed) as medical_bed FROM ward WHERE hospital_id=?";

String patient_transfer_request_approval ="update patient_transfer set status=?, remarks=? WHERE patient_ID=?";

String transfer_patient_to_new_hospital = "update user_sign_up set ward_no=?, bed_no=(select bed_no from bed where patient_id is NULL and ward_no=? order by RAND() LIMIT 1), employee_id_1=NULL, employee_id_2=NULL, doctor_name_1=NULL, doctor_name_2=NULL where patient_id=?";

String random_ward= "select ward_no from ward where available_bed>0 and hospital_id=? order by RAND() LIMIT 1";

String update_in_bed_table ="UPDATE bed SET `patient_id` = NULL WHERE (`bed_no` =(select bed_no from user_sign_up where patient_id=?))";

String add_patient_in_bed_while_transfer = "update bed set patient_id = ? where bed_no=(select bed_no from user_sign_up where patient_id=?)";

String bed_status_available_update_while_transfer = "update `ward` set available_bed = available_bed+1 where ward_no=(select ward_no from user_sign_up where patient_id=?)";

//REQUEST DOCTOR FOR PATIENT

String fetch_hospital_id = "Select * from hospital";

String fetch_department = "Select * from department";

                                                // DOCTOR

// PRESCRIPTION

String Fetch_Medicine_Name =" select distinct medicine_name from medicine"; 

String Fetch_Medicine_Power = "select distinct medicine_power from medicine";

String hospital_name_with_id = "Select * from hospital where hospital_id = ?"; 

// TRANSFER REQUEST 

String fetch_hospital_list_except_current_hospital = "select hospital_id, hospital_name from hospital where hospital_id !=( select hospital_id from doctor where username  =?)"; 

String doc_transfer_req_insertion = "insert into transfer (employee_id, new_hospital_name, urgent, problem, reason, approval, transfer_type, new_hospital_id) values ((select employee_id from doctor where username=?),?,?,?,?,?,?,?)";


// TRANSFER ORDER

String doctor_details_with_username = "select * FROM DOCTOR where USERNAME=?";

String doctor_accepting_transfer_order = "UPDATE doctor SET hospital_id = ?, TRANSFER_STATUS = 'ACCEPTED', joining_date=(SELECT CURDATE()), last_denied_reason='NOT SPECIFIED YET',new_hospital_id=null,deny_date=null where employee_id=?";

String report_to_admin_on_deny_of_doctor = "update doctor set transfer_status='REPORTED TO ADMIN' WHERE employee_id=?";

String fetch_random_employee_id_on_accepting_transfer_order_by_doctor = "select employee_id from doctor where specialization=(select specialization from doctor where employee_id=?) and hospital_id=? and employee_id != ? order by RAND() LIMIT 1";

String update_employee_id_1_on_accepting_transfer_order_by_doctor = "update user_sign_up set employee_id_1 = ?, doctor_name_1=(select doctor_name from doctor where employee_id=?) where employee_id_1=?";

String update_employee_id_2_on_accepting_transfer_order_by_doctor = "update user_sign_up set employee_id_2 = ?, doctor_name_2=(select doctor_name from doctor where employee_id=?) where employee_id_2=?";

String update_transfer_status_back_to_normal_on_accepting_transfer_order_by_doctor = "update doctor set joining_date=(SELECT CURDATE()), last_denied_reason='NOT SPECIFIED YET',transfer_status='NO TRANSFER ORDER ' where employee_id=?";

String doctor_denying_transfer_order ="update doctor set last_denied_reason=?, deny_date=(SELECT CURDATE()), new_hospital_id=null, transfer_status='NO TRANSFER ORDER ' where employee_id=?";
// PATIENT TRANSFER REQUEST

String filled_bed_list_with_ward ="select bed_no from bed where patient_id is not null and ward_no=?";

String fetch_patient_status_with_ward_bed ="select * from patient_status where patient_id=(select patient_id from user_sign_up where ward_no=? and bed_no=?)";

String update_patient_transfer ="insert into patient_transfer (patient_id, ward_no, bed_no, current_status, reason, status) values ((select patient_id from user_sign_up where ward_no =? and bed_no=?), ?, ?, ?, ?, 'NO RESPONSE') ON DUPLICATE KEY UPDATE ward_no=?, bed_no=?, current_status=?, reason=?, status='NO RESPONSE'";

String fetch_ward_where_patient_available_by_doctor_username ="select ward_no from ward where hospital_id=(select hospital_id from doctor where username=?) and available_bed<total_bed";

// VIEW REPORT
                                                // NURSE

String hospital_with_ward =" select hospital_name from hospital where hospital_id=(select hospital_id from ward where ward_no=?)";

// UPDATE PATIENT STATUS

String ward_with_available_bed = "select ward_no from ward where available_bed >0 and hospital_id in (select hospital_id from ward where ward_no in (select ward_no from nurse where username=?))";

String filled_bed_list ="select bed_no from bed where patient_id is not null";

String NEW_OR_UPDATE_Patient_Status_Update = " INSERT INTO patient_status (patient_id, full_name, ward_no, bed_no, blood_pressure, oxygen_level, pulse_rate, remarks) VALUES((select patient_id from user_sign_up where ward_no=? and bed_no=?),(select CONCAT((select first_name from user_sign_up where ward_no=? and bed_no=?),' ',(select middle_name from user_sign_up where ward_no=? and bed_no=?),' ',(select last_name from user_sign_up where ward_no=? and bed_no=?)) as name), ?,?,?,?,?,?) ON DUPLICATE KEY UPDATE ward_no =?, bed_no =?, full_name =(select CONCAT((select first_name from user_sign_up where ward_no=? and bed_no=?),' ',(select middle_name from user_sign_up where ward_no=? and bed_no=?),' ',(select last_name from user_sign_up where ward_no=? and bed_no=?)) as name), blood_pressure =?, oxygen_level =?, pulse_rate =?, remarks =?;";

//BLOOD REQUEST

String A_pos_Blood_Availability = "select Availability from blood where blood_group='A+' and bloodbank_id in(select  bloodbank_id from hospital where hospital_id in(select hospital_id from ward where ward_no in (select ward_no from nurse where username=?)))"; 

String A_neg_Blood_Availability = "select Availability from blood where blood_group='A-' and bloodbank_id in(select  bloodbank_id from hospital where hospital_id in(select hospital_id from ward where ward_no in (select ward_no from nurse where username=?)))"; 

String B_pos_Blood_Availability = "select Availability from blood where blood_group='B+' and bloodbank_id in(select  bloodbank_id from hospital where hospital_id in(select hospital_id from ward where ward_no in (select ward_no from nurse where username=?)))"; 

String B_neg_Blood_Availability = "select Availability from blood where blood_group='B-' and bloodbank_id in(select  bloodbank_id from hospital where hospital_id in(select hospital_id from ward where ward_no in (select ward_no from nurse where username=?)))"; 

String AB_pos_Blood_Availability = "select Availability from blood where blood_group='AB+' and bloodbank_id in(select  bloodbank_id from hospital where hospital_id in(select hospital_id from ward where ward_no in (select ward_no from nurse where username=?)))"; 

String AB_neg_Blood_Availability = "select Availability from blood where blood_group='AB-' and bloodbank_id in(select  bloodbank_id from hospital where hospital_id in(select hospital_id from ward where ward_no in (select ward_no from nurse where username=?)))"; 

String O_pos_Blood_Availability = "select Availability from blood where blood_group='o+' and bloodbank_id in(select  bloodbank_id from hospital where hospital_id in(select hospital_id from ward where ward_no in (select ward_no from nurse where username=?)))"; 

String O_neg_Blood_Availability = "select Availability from blood where blood_group='o-' and bloodbank_id in(select  bloodbank_id from hospital where hospital_id in(select hospital_id from ward where ward_no in (select ward_no from nurse where username=?)))"; 

String Blood_Available_Update = "update `blood` set availability = availability-? where bloodbank_id=(select  bloodbank_id from hospital where hospital_id =(select hospital_id from ward where ward_no = (select ward_no from user_sign_up where patient_id=?))) and blood_group=?;";

String Blood_group_fetch = "select blood_group from blood where availability>0  and bloodbank_id in(select  bloodbank_id from hospital where hospital_id in(select hospital_id from ward where ward_no in (select ward_no from nurse where username=?)));";

String fetch_patient_id = "select patient_id from user_sign_up where discharge_date is null and patient_id>2022000";
 
//PATIENT DETAILS UPDATE

String doctor_list = "select employee_id,doctor_name from doctor where hospital_id in (select hospital_id from ward where ward_no in (select ward_no from nurse where username=?))";

String Patient_Details_Update = " INSERT INTO user_sign_up (patient_id, admit_datetime, ward_no, bed_no, employee_id_1, doctor_name_1, employee_id_2, doctor_name_2) VALUES(?,?,?,?,?,?,?,?) ON DUPLICATE KEY UPDATE  admit_datetime=?, ward_no=?, bed_no=?, employee_id_1=?, doctor_name_1=?, employee_id_2=?, doctor_name_2=?";

String bed_status_available_update = "update `ward` set available_bed = available_bed-1 where ward_no=?";

String add_patient_in_bed = "update bed set patient_id = ? where bed_no=?";

String Fetch_Doctor = "SELECT * FROM DOCTOR WHERE HOSPITAL_ID = (SELECT HOSPITAL_ID FROM WARD WHERE WARD_NO =(SELECT WARD_NO FROM NURSE WHERE USERNAME=?))";

String bed_list ="select bed_no from bed where patient_id is null and ward_no=?";

//NURSE TRANSFER REQUEST

String fetch_hospital_list_except_current_hospital_for_nurse = "select hospital_id, hospital_name from hospital where hospital_id !=( select current_hospital_id from nurse where username  =?)"; 

String nurse_transfer_req_insertion = "insert into transfer (employee_id, new_hospital_name, urgent, problem, reason, approval, transfer_type, new_hospital_id, shift) values ((select employee_id from nurse where username=?),?,?,?,?,?,?,?,?)";


// NURSE TRANSFER ORDER

String nurse_details_with_username = "select * FROM nurse where USERNAME=?";

String nurse_accepting_transfer_order = "UPDATE nurse SET current_hospital_id = ?, ward_no=?, current_shift=?, new_shift=null, TRANSFER_STATUS = 'NO TRANSFER ORDER ', joining_date=(SELECT CURDATE()), last_denied_reason='NOT SPECIFIED YET',new_hospital_id=null,deny_date=null where employee_id=?";

String report_to_admin_on_deny_of_nurse = "update nurse set transfer_status='REPORTED TO ADMIN' WHERE employee_id=?";

String nurse_denying_transfer_order ="update nurse set last_denied_reason=?, deny_date=(SELECT CURDATE()), new_hospital_id=null, new_shift=null, transfer_status='NO TRANSFER ORDER ' where employee_id=?";

String fetch_random_ward ="select ward_no from ward where hospital_id=? order by RAND() LIMIT 1 ";


                                                        //USER

//ADMISSION CHECK

// VIEW PATIENT STATUS

String Patient_Status_view = "select full_name, ward_no, bed_no, blood_pressure, oxygen_level, pulse_rate, remarks from patient_status where patient_id=?";

String dob ="select dob from user_sign_up where patient_id=?";

// DOWNLOAD PRESCRIPTION

String fetch_patient_id_with_mail  ="select patient_id from user_sign_up where email_id=?";

//DIAGONOSTIC REPORT


//MEDICAL BILLS


//OPD

String department_name_with_id = "select department_name from department where department_id=?";

String doctor_list_with_hospital_id_department_id = "select * from doctor where hospital_id=? and specialization=(select department_name from department where department_id=?)";
//OTHERS

String Fetch_Patient_Details_WITH_WARD_AND_BED =" select patient_id, first_name, middle_name, last_name from user_sign_up where ward_no=? and bed_no=? ";
 
String SQL_safe_update = "SET SQL_SAFE_UPDATES = 0";
 
}
//end of interface