import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public aspect Logger {
    File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    pointcut success() : call(* moneyMakeTransaction(..) );
    after() : success() {
    	String textToAppend = "Transacción realizada el " + cal.getTime().toString() + "\n";
    	try {
			BufferedWriter writer = new BufferedWriter(
			        new FileWriter(file, true));
			writer.write(textToAppend);
		    writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}   
    }
    pointcut success2() : call(* moneyWithdrawal(..) );
    after() : success2() {
    	String textToAppend = "Retiro realizado el " + cal.getTime().toString() + "\n";
    	try {
			BufferedWriter writer = new BufferedWriter(
			        new FileWriter(file, true));
			writer.write(textToAppend);
		    writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}   
    	
    	
    }
    
}