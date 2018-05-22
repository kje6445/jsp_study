package lecture1;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Date1 {

	 public static void main(String[] args) {
		 Date today = new Date();
		 
		 SimpleDateFormat f1 = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");//hh면 두자리 문자열로 받음
		 String s1 = f1.format(today);					//a 는 오전 오후
		 System.out.println(s1);// 2018-03-25 오후 02:17:25로 출력
		 
		 SimpleDateFormat f2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//HH은 14시로 출력
		 String s2 = f2.format(today);
		 System.out.println(s2); //2018-03-25 14:19:19 로 출력
		 
		 SimpleDateFormat f3 = new SimpleDateFormat("yy-M-d H:m:s");
		 String s3 = f3.format(today);
		 System.out.println(s3);//18-3-25 14:20:24 로 출력
		 
		 SimpleDateFormat f4 = new SimpleDateFormat("yy-M-d H:m:s E"); //E는 요일
		 String s4 = f4.format(today);
		 System.out.println(s4);//18-3-25 14:20:24 로 출력

	 }
}
