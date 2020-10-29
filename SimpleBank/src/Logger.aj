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
    	save(file, textToAppend);
    }
    
    pointcut success2() : call(* moneyWithdrawal(..) );
    after() : success2() {
    	String textToAppend = "Retiro realizado el " + cal.getTime().toString() + "\n";
    	save(file,textToAppend);
    }
    
    static void save(File file, String message) {
    	try {
			BufferedWriter writer = new BufferedWriter(
			        new FileWriter(file, true));
			writer.write(message);
		    writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
    
}