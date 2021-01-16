package com.web.pet.forum.webSocket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class MsgScoketHandle  extends TextWebSocketHandler{
		
	 private List<WebSocketSession> sessions = new CopyOnWriteArrayList<>();
	 
	 private static Map<String,String> knowldgeMapper = new HashMap<>();
	 private static Map<String,String> catMapper = new HashMap<>();
	 private static Map<String,String> dogMapper = new HashMap<>();
	 private static String a1 = "其實貓咪看窗外不是想出門🐱<br>"
		    	+ "你家的貓咪也喜歡在窗戶前往外看嗎？原因不止是想出門！快往下看看為什麼吧！<br><br>";
	 private static String a2 = "1. 成年的貓咪在發情時，會想出門找其他貓咪生小孩，特別是公貓！<br><br>"
				+ "2. 貓咪是有領域性的動物，會把窗外的區域視為自己的領土，往窗外看有巡視地盤的意思。<br><br>"
				+ "3. 貓咪天生喜愛探索，對外面的世界感到好奇，看到小動物還可能發出「嘎嘎」的聲音。<br><br>"
				+ "4. 窗邊常有暖暖的陽光灑進，是享受日光浴的好地方。"
				+ "你家的貓咪也會往外看嗎？你覺得他是哪一種情況呢？回家觀察看看吧！";  
	 private static String b1 = "貓咪為什麼會對窗外嘎嘎叫？🐱<br><br>";
	 private static String b2 = "牠是在模擬咬斷獵物脖子唷！這種現象稱為「真空行為」泛指貓狗突然做出某些行為，但觸發行為的「目標」並不存在。";  
	 private static String c1 = "貓咪睡覺位置大解密！🐱<br>"
		    	+ "原來貓咪的睡覺位置會代表貓咪對你的想法？！快往下看看，你家的貓咪是哪一種呢？<br><br>";
	 private static String c2 = "１.靠腳或床邊／信任度⭐⭐ - <br>"
				+ "貓貓雖然對你有信賴感，但可能還是因為一些因素想保持距離（例如怕被踹到ＸＤ）所以才會選擇離你近但保有自己空間的位置唷！<br><br>​"
				+"２.頭的周圍／信任度⭐⭐⭐⭐ - <br>"
				+ "​貓咪會願意睡在頭附近，代表你是像家人、同伴一樣能讓他安心的存在唷！除此之外，睡在頭頂也能聞到毛拔麻頭髮、頭皮等熟悉的氣味，有助於氣味交換與標記，讓他安穩的進入夢鄉～<br><br>"
				+"３.身旁或懷裡／信任度⭐⭐⭐⭐⭐​ - <br>"
				+ "你的貓貓超級愛你！對你的警戒心很小，才會願意鑽進被窩與你一起睡覺～除了很信賴你，鑽進被窩也可能是因為比較好取暖唷🤣！<br><br>​"
				+"４. 其他地方／信任度⭐ - <br>"
				+ "貓咪對你還沒有什麼安全感，所以需要隨時緊戒狀況😭毛拔麻可以多多陪伴貓咪、與他們互動，來增加好感度唷！<br><br>​"
				+"看完了這麼多種睡覺位置，你家的貓咪是哪一種呢？和他平常對你的態度有相同嗎？回家快觀察看看吧！";  
	 private static String d1 = "原來狗狗飛機耳可能不是因為開心？！🐶<br>"
		    	+ "有看過狗狗開飛機嗎？狗狗的心情不能只用耳朵來判斷？！快往下看看，來解讀狗狗的內心戲😳！<br><br>";
	 private static String d2 = "1. 開心的飛機耳 - <br>"
				+ "當狗狗開心的時候，會出現飛機耳並且搭配瘋狂擺動的尾巴、壓低的身體，常常出現於見到奴才（或是看到肉肉）的時候，是對你示好的表現！<br><br>​"
				+"2. 害怕的飛機耳 - <br>"
				+ "狗狗害怕或緊張的時候也會出現飛機耳，但這個時候他會夾著尾巴、或是輕輕拍打地面，而且不太敢直視你的眼睛。<br><br>"
				+"3. 放鬆的飛機耳 - <br>"
				+ "狗狗放鬆時也有可能飛機耳！當休息時聽到遠方的聲音、又懶得站起來的時候，就會把耳朵向後，方便自己聽得更清楚。通常這種時候狗狗都是趴著，搭配靜止不動的尾巴。<br><br>​"	    	    					
				+"你家的毛孩都在什麼時候對你開飛機呢？快回家去觀察看看吧！<br><br>​";  
	 private static String e1 = "原來貓咪也會愛吃醋？！🐱<br>"
		    	+ "貓咪「吃醋」起來也是很可怕的！快往下看看，吃醋貓貓會有什麼反應呢🤣？<br><br>";
	 private static String e2 = "貓咪吃醋的可能對象：<br><br>"
				+ "貓咪是地域性很強的動物，任何侵犯他地盤的人（或是東西）都可能讓他不開心！<br>"
				+ "常見的有新生兒、其他貓狗、人、手機、遊戲機⋯⋯🤣<br><br>​"
				+"貓咪吃醋會有什麼表現：<br><br>"
				+ "貓咪一開始會先喵喵叫，嘗試觸碰你、進入你的「私人空間」，到處亂尿尿也是他宣示主權的方式之一。嚴重一點可能會破壞傢俱，甚至直接攻擊吃醋對象😰！<br><br>"
				+"該怎麼安撫吃醋貓？<br><br>"
				+ "1️. 保留安全空間：<br>"
				+ "如果真的沒辦法避免貓咪的「吃醋對象」，至少要幫貓咪保留安全空間。可以是他熟悉的睡墊、紙箱⋯讓貓咪安心。<br><br>​"	    	    					
				+ "2️. 多花時間陪伴：<br>"
				+ "他可以多摸他、陪他玩，讓貓咪知道你還是他的！<br><br>​"	    	    					
				+ "3️. 當貓咪冷靜時給獎勵貓咪：<br>"
				+ "「吃醋」時情緒會特別激動，可以在他旁邊等他冷靜、並且立即給予獎勵。<br><br>​<br>"	    	    					
				+ "若家裡是多貓家庭，則可以用這些方式讓貓咪嘗試適應，避免吃醋：<br><br>​"	    	    					
				+ "1. 資源準備貓數量＋１：例如：３隻貓咪需要４個貓砂盆，避免強勢貓咪搶奪資源。<br><br>​"	    	    					
				+ "2. 安排垂直空間：貓咪發生爭吵食，垂直空間可以提供逃生路線，避免雙方處於高壓狀態。<br><br>​"	    	    					
				+ "3. 避免共用飯碗：共食可能讓比較敏感的貓咪感到壓迫，應將碗放在不同空間。<br><br>​";  
	 private static String f1 = "短腿狗狗大集合！原來還有假短腿？！🐶<br>"
		    	+ "除了柯基、臘腸，還有哪些狗狗是短腿成員？<br>"
		    	+ "有些狗狗看起來腿短短，卻只是假短腿？！快下滑看看短腿排行榜🤣！<br><br>";
	 private static String f2 = "短腿狗是依據身體、腿的比例做判斷，定義為「腿的長度＜身體長度」，並且由肩膀高度作為腿長標準。<br>"
				+ "由短到長依序為臘腸、巴哥、法鬥、柯基、巴吉度獵奇，其中又以臘腸、柯基、巴吉度最具代表性。<br><br>"
				+ "身體長、腿短短代表：<br><br>​"
				+"1️.臘腸狗其實是超專業的獵犬，負責捕捉獾、兔子等小動物，短短的腿是為了幫助他鑽進洞穴！<br>"
				+ "因為祖先是獵犬，臘腸狗非常活潑好動，要注意別讓他在高低落差的地方奔跑，避免脊椎受傷喔～<br><br>"
				+"2.柯基最早是用來趕牛的「牧牛犬」，短腿可以讓他在牛群間自由奔跑，不怕被牛角撞傷。<br>"
				+ "柯基也因此具備體力超好、叫聲大、愛管東管西的特性，每天都要散步半小時以上，否則會開始拆家🤣<br><br>"
				+"3.巴吉度獵犬雖然稱為獵犬，性格卻很溫和黏人唷！因為對小孩有耐心且黏人，也是一個優質的保母！<br>"
				+ "身為專業的獵犬，走到哪裡都會聞個不停，長長的耳朵可能會因此拖地，需要奴才多多幫他清潔唷～<br><br>"
				+ "這些短腿狗狗你最喜歡誰？還有想知道哪些狗狗的秘密嗎？鎖定汪喵冷知識吧！<br><br>​";  
	 private static String g1 = "虎斑貓大集合！原來美短、豹貓都是虎斑貓？！🐱<br>"
		    	+ "原來虎斑貓有這麼多種😳？！快下滑看看不同虎斑花紋的貓咪種類！<br>"
		    	+ "只要額頭有 M 型花紋的貓咪都可以稱為「虎斑貓」，依照花紋的形狀又分成經典紋、魚骨紋、斑點紋、多層色虎斑。<br><br>";
	 private static String g2 = "1.美國短毛貓是最具代表性的虎斑貓之一，銀色、黑色的紋路很受歡迎😍<br>"
				+ "個性溫順愛撒嬌，是貓咪界的好好先生；同時又充滿好奇心，喜歡在家裡探險。<br><br>"
				+ "2.阿比西尼亞貓的斑紋沒這麼明顯，主要是出現在腹部以及腳掌。<br>"
				+ "是傳說中的埃及神貓，熱愛戶外活動、愛交朋友、貓緣很好🤣因此也需要花比較多時間陪伴。<br><br>​"
				+"3.豹貓身上有漂亮的斑點，又被稱為孟加拉貓。號稱 #最像狗狗的貓咪，可以跟狗狗一樣學會許多指令，還超喜歡玩水！<br>"
				+ "養豹貓家裡一定要有足夠的空間，也要花時間帶他出門散步喔～<br>"
				+"4.魚骨紋虎斑就是大家最熟悉的虎斑米克斯啦～<br>"
				+ "虎斑貓警戒心比較強，但是熟了以後就會變得超撒嬌！<br><br>"
				+"你家的虎斑是哪種紋路呢？你覺得個性分析有準嗎？回家時快觀察看看吧～<br><br>";  
	 private static String h1 = "狗狗愛把屁屁對著你？🐶<br>"
		    	+ "原來狗狗把屁股對著你是愛的表現😍？快下滑看看狗狗把屁股朝向你的 3 個原因吧！<br><br>";
	 private static String h2 = "狗狗為什麼會把屁屁對著你？<br><br>"
				+ "1.屁股是狗狗最沒有防備的部位，當他放心把屁屁對著你，代表他深信你不會傷害他，是信任與愛的表現！<br><br>"
				+"2.當狗群遇到敵人，習慣背對背保護彼此。<br>"
				+ "當狗狗用屁股對著你，並且對外人露出尖牙，代表他擔心你受到傷害、想要保護你。<br>"
				+"3.狗狗可以藉由屁股把氣味留在主人身上，會讓他覺得跟你很親密，同時也對別人說：他是我的！<br><br>"
				+"吼～狗狗的行為真的好可愛啦！你家狗狗也會對你這樣嗎？快回家觀察看看吧！<br><br>";  
	 private static String i1 = "毛孩為什麼會磨屁屁？🐱🐶<br>"
		    	+ "貓咪狗狗磨屁股的樣子好滑稽🤣為什麼毛孩會有這種行為呢？一起來看看毛孩在地上嚕屁屁的原因吧！<br><br>";
	 private static String i2 = "1.貓咪狗狗的便便有可能因為拉肚子，或是毛髮纏繞而黏在肛門附近，毛孩為了把便便清除，只好在地板上磨蹭。<br><br>"
				+ "2.肛門腺位於貓咪狗狗的肛門兩側（４點、８點鐘方向），是幫助毛孩排便的潤滑劑。<br>"
				+ "如果肛門腺塞住、讓毛孩感到不舒服，就會在地上磨屁屁。毛拔麻可以定期幫毛孩擠肛門腺，或是請美容院、獸醫師協助。如果發現肛門腺已經紅腫發炎，則要立即請就醫處理！<br><br>"
				+"3.貓咪狗狗身體癢癢的時候會透過腳、嘴巴搔癢，但是屁屁的位置比較難觸碰到，毛孩就有可能會用摩擦地方的方式唷！<br>"
				+ "所以有人說…身形比較胖的毛孩更容易磨屁屁，因為他們自己舔不到🤣<br>"
				+"你有看過毛孩磨屁屁嗎？你覺得他磨屁股的原因是什麼呢？下次觀察看看吧！<br><br>";  
	 private static String j1 = "狗狗歪頭不是在賣萌？！🐶<br>"
		    	+ "狗狗歪頭、呆萌的樣子真的好可愛！為什麼狗狗會出現這樣的行為呢？一起來看看吧❤️<br><br>";
	 private static String j2 = "1.狗狗的聽覺雖然靈敏，但是沒辦法在第一時間準確判斷聲音來源。<br>"
				+ "當狗狗聽到陌生、或是他感興趣的聲音，會藉由歪頭移動耳朵的方向，幫助自己聽得更清楚。<br>"
				+ "所以幼犬會比成犬更常出現歪頭的動作！<br><br>"
				+ "2.歪頭的動作最常出現在「長鼻子狗狗」身上！狗狗在看東西的時候，下半部的視野會被凸出來的鼻子遮住，為了看清楚事物的全貌，狗狗自然會將頭左右傾斜、讓自己看得更清楚。<br>"
				+ "毛拔麻可以把拳頭擺在鼻子前，模擬狗狗的視野、體會看看喔！<br><br>"
				+"3.還有一種可愛的說法是，當狗狗做出歪頭動作時，大部分的毛拔麻都會做出開心的反應、給予正向的回饋，時間久了狗狗自然會將歪頭和主人開心做連結，常常對你做出這萌死人的舉動。<br><br>"
				+"狗狗真的是很貼心可愛的動物，觀察你家狗狗是因為哪個原因歪頭吧！<br><br>";  
	 private static String k1 ="沒有一隻貓不愛拍屁屁？🐱<br>"
		    	+ "確認過眼神，是幫忙拍屁屁的人！你家的貓咪也一拍就停不下來嗎？揭密貓咪愛拍屁屁的真相！<br><br>";
	 private static String k2 = "1. 拍這個地方會讓貓咪覺得很舒適。<br>"
				+ "貓咪尾巴部位神經分布密集，無論是撫摸還是拍打，貓咪都會像觸電一樣，感覺很強烈！<br><br>"
				+ "2. 貓咪的屁股有個特別的穴道—「百會穴」，按摩、拍打穴道不但會讓貓咪感到舒服，還能促進貓咪的身體健康、放鬆情緒。<br>"
				+ "除了屁股，貓咪的另一個百會穴位在兩隻耳朵的正中間，按摩這裡也會讓貓咪感到很舒服唷～<br><br>"
				+"3.在幼貓時期，母貓會幫忙舔拭小貓的屁股來幫助排便。因此成年後的貓被毛拔麻撫摸、拍打屁股時，會將毛拔麻聯想成母貓，被拍屁屁是表達親密、視對方為家人的方式。<br>"
				+"拍屁屁除了可以讓毛孩放鬆，也是一種增進彼此感情的方式唷！如果想和毛孩更進一步的培養感情，不妨試著多撫摸毛孩的屁屁，找出毛孩喜愛的拍屁屁方式。<br><br>"
				+"不過雖然大部分的貓咪喜歡拍屁屁，還是有少數貓咪不喜歡的！如果貓咪表示抗拒，或是嘗試掙脫，就不要勉強毛小孩啦。<br><br>";  
	
				
	    static {
	    	knowldgeMapper.put(a1, a2);	    	
	    	catMapper.put(a1, a2);
	    	knowldgeMapper.put(b1, b2);
	    	catMapper.put(b1, b2);	    	
	    	knowldgeMapper.put(c1, c2);
	    	catMapper.put(c1, c2);	    	
	    	knowldgeMapper.put(d1, d2);
	    	dogMapper.put(d1, d2);	    	
	    	knowldgeMapper.put(e1, e2);
	    	catMapper.put(e1, e2);	    	
	    	knowldgeMapper.put(f1, f2);
	    	dogMapper.put(f1, f2);    	
	    	knowldgeMapper.put(g1, g2);
	    	catMapper.put(g1, g2);	    	
	    	knowldgeMapper.put(h1, h2);
	    	dogMapper.put(h1, h2);	    	
	    	knowldgeMapper.put(i1, i2);
	    	catMapper.put(i1, i2);
	    	dogMapper.put(i1, i2);	    	
	    	knowldgeMapper.put(j1, j2);
	    	dogMapper.put(j1, j2);	    	
	    	knowldgeMapper.put(k1, k2);
	    	catMapper.put(k1, k2);
	    }
	 
	  
	    /**
	     *  Description: 關閉連線 刪除session
	     *  @author ching  DateTime 2021/1/14 下午 01:43:21
	     *  @param session
	     *  @param status
	     *  @throws Exception
	     */
	    @Override
	    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	        sessions.remove(session); //從List中移除	        
	    }

	  
	    /**
	     *  Description: 連線成功 新增session
	     *  @author ching  DateTime 2021/1/14 下午 01:43:38
	     *  @param session
	     *  @throws Exception
	     */
	    @Override
	    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	        sessions.add(session);
	    }

	 
	    /**
	     *  Description: 處理用戶發送的訊息 再回傳給用戶
	     *  @author ching  DateTime 2021/1/14 下午 01:43:53
	     *  @param session
	     *  @param message
	     *  @throws Exception
	     */
	    @Override
	    public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	    	 String clientMessage = message.getPayload(); 	    	
	    	 
	    	 Set keySet = MsgScoketHandle.knowldgeMapper.keySet();	    	 
	    	 Set catKeySet = MsgScoketHandle.catMapper.keySet();	    	 
	    	 Set dogKeySet = MsgScoketHandle.dogMapper.keySet();	    	 
	    	
	         if (clientMessage.equalsIgnoreCase("OK") || clientMessage.equalsIgnoreCase("N") ) {	        	 
	        	 Random random = new Random();
	        	 List<String> keys = new ArrayList<String>(keySet);
	        	 String randomKey = keys.get( random.nextInt(keys.size()) );		    		
		    	 session.sendMessage(new TextMessage(randomKey + MsgScoketHandle.knowldgeMapper.get(randomKey)));		    	 
	         }
	         else if(clientMessage.equalsIgnoreCase("cat")) {
	        	 Random random = new Random();
	        	 List<String> keys = new ArrayList<String>(catKeySet);
	        	 String randomKey = keys.get( random.nextInt(keys.size()) );		    		
		    	 session.sendMessage(new TextMessage(randomKey + MsgScoketHandle.catMapper.get(randomKey)));
	         }
	         else if(clientMessage.equalsIgnoreCase("dog")) {
	        	 Random random = new Random();
	        	 List<String> keys = new ArrayList<String>(dogKeySet);
	        	 String randomKey = keys.get( random.nextInt(keys.size()) );		    		
		    	 session.sendMessage(new TextMessage(randomKey + MsgScoketHandle.dogMapper.get(randomKey)));
	         }
	         else if(clientMessage.equalsIgnoreCase("Q")) {
	        	 session.sendMessage(new TextMessage("感謝使用，歡迎下次再來！"));
	         }
	         else {
	            session.sendMessage(
	                  new TextMessage("無法取得相關資料.....請更換關鍵字！"));
	         }
	    }	    	
	    
	}
	    
	    
	 
	   
   

