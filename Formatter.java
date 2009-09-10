import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.HashMap;
public class Formatter {
		public static void main(String[] args) throws Exception{
	HashMap<String, Integer> imap = new HashMap<String, Integer>();
	HashMap<String, Integer> jmap = new HashMap<String, Integer>();
				int j = 0;

	BufferedWriter vocab = new BufferedWriter(new FileWriter("vocab"));

	for(String file : args){
			BufferedReader in = new BufferedReader(new FileReader(file));
			BufferedWriter out = new BufferedWriter(new FileWriter(file + "n"));
			String feats = in.readLine();
			int i = 0;
			while(feats != null){
		String[] vals = feats.split(" ");
		String key = file + " " + vals[0];
		if(imap.get(key) == null){
				imap.put(key, ++i);
		}
		if(jmap.get(vals[1]) == null){
				jmap.put(vals[1], ++j);
				vocab.write(vals[1] + "\n");
		}
		out.write(imap.get(key) + " " + jmap.get(vals[1]) + " " + vals[2] + "\n");
		feats = in.readLine();
			}
	 
		out.close();
 
	}

	vocab.flush();

		}
}
