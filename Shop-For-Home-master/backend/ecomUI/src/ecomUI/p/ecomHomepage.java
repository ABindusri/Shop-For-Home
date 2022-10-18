package ecomUI.p;

import java.util.Scanner;

import ecomUI.dao.AdminDao;
import ecomUI.dao.userDao;
import model.user;

public class ecomHomepage {
	public static void main(String[] args) {
		System.out.println("Enter your choice here");
		System.out.println("Enter 1 for Admin");
		System.out.println("Enter 2 for user");
		System.out.println("Enter 3 for New user");

		int ch;
		boolean res=false;
		String res2=null;
		String name, passowrd;
		int mobile;

	AdminPage admin=new AdminPage();
	AdminDao adao=new AdminDao();
	userDao udao= new userDao();
	userPage user= new userPage();
	
		

		do {

			Scanner sc = new Scanner(System.in);
			ch = sc.nextInt();

			switch (ch) {
			case 1:
				System.out.println("Enter username");
				name = sc.next();
				System.out.println("Enter password");
				passowrd = sc.next();
				// DAO: Validation with Database
				res=adao.login(name,passowrd);
				
				if (res == true)
					{System.out.println(" Welcome Admin");
				     admin.Admin();}
				else
					System.out.println("Check the login details");

				break;
			case 2:
				System.out.println("Enter username");
				name = sc.next();
				System.out.println("Enter passowrd");
				passowrd = sc.next();
				// DAO: Validation with Database
				res2=udao.login(name,passowrd);

				if (res2 == null) {
					System.out.println("Check the login details");
				}
				else {
					System.out.println(" Welcome" + res2);

					user.user();

				}
				break;
			case 3:
				System.out.println("Enter your details");
				System.out.println("Enter username");
				name = sc.next();
				System.out.println("Enter passowrd");
				passowrd = sc.next();
				System.out.println("Enter mobile");
				mobile = sc.nextInt();
				user obj=new user(name,passowrd,mobile);
				boolean objcreation=udao.signup(obj);
				if(objcreation==true) {
					System.out.println("Registration successfull");
				}
				else {
					System.out.println("Registration failed");
				}
				break;

	
			case 0:
				System.out.println("Session ended");
				break;
			default:
				System.out.println("Error");

			}
		} while (ch != 0);

	}
}
