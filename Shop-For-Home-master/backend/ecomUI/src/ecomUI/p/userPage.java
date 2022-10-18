
	package ecomUI.p;

	import java.util.Scanner;

	public class userPage {

		static int c;
		
		public  void user() {
			
				System.out.println("Enter your choice here ");
				System.out.println("Enter 1 for cart");

				System.out.println("Enter 2 for product details ");

				System.out.println("Enter 3 for wishlist");
				do{
			Scanner sc = new Scanner(System.in);

			c = sc.nextInt();
			

			switch (c) {
			case 1:
				System.out.println("Adding to cart");
				break;
			case 2:
				System.out.println("Product details");
				break;
			case 3:
				System.out.println("Adding to wishlist");
				break;
			}
			}while(c!=0);
		
		
		}
	}

		
		

