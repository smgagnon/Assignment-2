FS 1030 – Database Design and Principles, Take Home Assignment #2
Question 1. Write SQL statements for the Library Relational Database Schema showed above. Specify
- Please see folder named Question 1. 
- All SQL statements to create table are located in createtable.sql
- All SQL statements to insert data into the table are located in insertingdata.sql

Question 2. Design a customer support/support ticketing website. The website should have:
1) A registration page – To register new customers.
2) A login page – Where customers and support staff can login.
3) Create a ticket page – Where customers can create a new support ticket.
4) View Open Tickets page – Where customers can view existing tickets opened by them and the ticket status. The list should be sorted by latest tickets.
5) View Ticket Details page – Where customer can view ticket details and reply to the existing ticket.

Please clone file and NPM install and start to see website.

I came across many issues when creating this website. Some of which I have not figured out yet. I have outlined below what I am working on and would like to fix for future iterations of this website and a list of future improvements that I would like to figure out how to implement to improve the quality of the website. Although I struggled with creating this website, I learned more in this one class about web development then I have in my last 3 classes combined. 

Issues: 
EMP LOGIN
- When logging in as 'emp' does not redirect to the correct home page, should be ‘/tickets’ where the employee can log in and view all active tickets and click on each one to respond to it and mark it Resolved if needed.
    - if you go to http://localhost:3000/tickets
    - this page will display properly.
- When you go to select a specific ticket and ‘reply to ticket’ the reply and status do not post to the database, they submit as ‘undefined’. 

USER LOGIN
- When logging in as ‘user’, the user dashboard displays all that users submitted tickets with the active and oldest tickets at the top. 
    - updating ticket gives an error, I tried many ways to update to the table but could not get it working without an error.
- Create New Ticket
    - the new ticket posts to the database but I would like it to return to the user_dashboard page with all the tickets on the page, it currently just shows one ticket.

Future Improvements:
With more time I would like to: 
- Have the register page automatically reroute to the user_dashboard or tickets page for admin profiles. 
- When creating a new ticket have the User Email & User ID fields automatically filled out based on user sessions and the boxes greyed out.
- Have the dates formatted in an easier to read format- ex Wed July 3 2019 07:24:04pm.
- Change the “status of ticket” button to only show the opposite selection from what is currently in the database. If “active” show “resolved”
- Add a button in the ‘update ticket’ page to delete ticket if no longer needed. 

