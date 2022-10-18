package ecomUI.p;

import java.util.Scanner;

public class AdminPage {

	static int c;
	
	public static void Admin() {
		do{
		Scanner sc = new Scanner(System.in);

		c = sc.nextInt();
		

		switch (c) {
		case 1:
			System.out.println("Adding new product");
			break;
		case 2:
			System.out.println("Product list");
			break;
		case 3:
			System.out.println("Update product");
			break;
		}
		}while(c!=0);
	
	}
}

	
	