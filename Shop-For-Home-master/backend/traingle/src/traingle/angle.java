package traingle;

import java.util.Arrays;
import java.util.Scanner;

public class angle {
	public static void main(String[] args) {
		int a[] = new int[3];
		int i;
		Scanner sc = new Scanner(System.in);

		for (i = 0; i < 3; i++) {
			a[i] = sc.nextInt();
		}
		Arrays.sort(a);

		checkAngle(a);

	}

	public static void checkAngle(int a[]) {
		if (a[0] * a[0] + a[1] * a[1] == a[2] * a[2]) {
			System.out.println("2");
		} else if (a[0] * a[0] + a[1] * a[1] > a[2] * a[2]) {
			System.out.println("1");

		} else {
			System.out.println("3");

		}
	}

}
