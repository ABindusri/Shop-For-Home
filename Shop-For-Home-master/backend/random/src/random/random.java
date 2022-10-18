package random;

		// TODO Auto-generated method stub
		import java.util.Scanner;
		 class random 
		{
		public static void main(String args[]) 
		{
		Scanner s=new Scanner(System.in);
		System.out.println("Enter any number: ");
		int number = s.nextInt();
		verifier.palfunc(number);

		}
		}
		class verifier{

		public static void palfunc(int number1){
		int x,y=0,temp=0;

		x=number1;
		while(number1>0)
		{
		x=number1%10;
		number1=number1/10;
		temp=temp*10+x;
		}
		if(temp==y)
		{
		System.out.println("Number is Palindrome");
		}
		else
		{
		System.out.println("not Palindrome");
		}
		}
		

	}


