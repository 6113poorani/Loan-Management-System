package com.loans;


import java.io.IOException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/StateServlet")
public class StateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private HashMap<String, String[]> stateData;
    private HashMap<String, String[]> cityData;

    @Override
    public void init() throws ServletException {
        // Initialize the state and city data (country-to-states and state-to-cities mapping)
        stateData = new HashMap<>();
        stateData.put("India", new String[] {" ","Andhra Pradesh","Arunachal Pradesh","Assam","Bihar","Chattisgarh","Goa","Gujarat","Haryana","Himachal Pradesh","Jharkhand","Karnataka",
        		"Kerala","Madhya Pradesh","Maharashtra","Manipur","Meghalaya","Mizoram","Nagaland","Odisha","Punjab","Rajasthan",
        		"Sikkim","TamilNadu","Telangana","Tripura","Uttarakhand","Uttar Pradesh","West Bengal"});

        cityData = new HashMap<>();
        cityData.put("TamilNadu", new String[] { " ","Chennai", "Coimbatore", "Madurai", "Tiruchirappalli", "Salem", "Erode", "Vellore", "Tirunelveli", "Thoothukudi", "Nagercoil", "Thanjavur", "Dindigul", "Cuddalore", "Kanchipuram", "Karur", "Ooty", "Kodaikanal", "Hosur", "Pollachi", "Ambur", "Ariyalur", "Dharmapuri", "Nagapattinam", "Perambalur", "Pudukkottai", "Ramanathapuram", "Sivaganga","Namakkal", "Tenkasi", "The Nilgiris", "Theni", "Tirupathur", "Tirupur", "Tiruvannamalai", "Tiruvarur", "Viluppuram"});
        cityData.put("Andhra Pradesh", new String[] { " ","Anantapur", "Chittoor", "East Godavari", "Guntur", "Krishna", "Kurnool", "Nellore", "Prakasam", "Srikakulam", "Visakhapatnam", "Vizianagaram", "West Godavari", "Y.S.R. Kadapa"});
        cityData.put("Arunachal Pradesh", new String[] { " ","Tawang", "West Kameng", "East Kameng", "Papum Pare", "Kurung Kumey", "Kra Daadi", "West Siang", "East Siang", "Siang", "Upper Siang", "Lower Siang", "Lower Dibang Valley", "Dibang Valley", "Anjaw", "Lohit", "Namsai", "Changlang", "Tirap", "Longding"});
        cityData.put("Assam", new String[] { " ","Barpeta", "Bongaigaon", "Cachar", "Darrang", "Dhemaji", "Dhubri", "Dibrugarh", "Goalpara", "Golaghat", "Hailakandi", "Hojai", "Jorhat", "Kamrup Metropolitan", "Kamrup Rural", "Karbi Anglong", "Karimganj", "Kokrajhar", "Lakhimpur", "Majuli", "Morigaon", "Nagaon", "Nalbari", "Sivasagar", "Sonitpur", "South Salmara-Mankachar", "Tinsukia", "Udalguri", "West Karbi Anglong"});
        cityData.put("Bihar", new String[] { " ","Araria", "Arwal", "Aurangabad", "Banka", "Begusarai", "Bhagalpur", "Bhojpur", "Buxar", "Darbhanga", "East Champaran", "Gaya", "Gopalganj", "Jamui", "Jehanabad", "Kaimur", "Katihar", "Khagaria", "Kishanganj", "Lakhisarai", "Madhepura", "Madhubani", "Munger", "Muzaffarpur", "Nalanda", "Nawada", "Patna", "Purnia", "Rohtas", "Saharsa", "Samastipur", "Saran", "Sheikhpura", "Sheohar", "Sitamarhi", "Siwan", "Supaul", "Vaishali", "West Champaran"});
        cityData.put("Chattisgarh", new String[] { " ","Bastar", "Bijapur", "Bilaspur", "Dantewada", "Dhamtari", "Durg", "Janjgir-Champa", "Jashpur", "Kanker", "Kabirdham (Kawardha)", "Korba", "Koriya", "Mahasamund", "Narayanpur", "Raigarh", "Raipur", "Rajnandgaon", "Sukma", "Surajpur", "Surguja"});
        cityData.put("Goa", new String[] { " ","Panaji", "Vasco da Gama", "Margao", "Mapusa", "Ponda", "Bicholim", "Curchorem-Cacora", "Cuncolim", "Curchorem", "Valpoi", "Sanguem", "Sanvordem", "Quepem", "Cortalim", "Tivim", "Sankhali", "Canacona", "Calangute", "Borda", "Arambol", "Mormugao"});
        cityData.put("Gujarat", new String[] { " ","Ahmedabad", "Surat", "Vadodara", "Rajkot", "Gandhinagar", "Bhavnagar", "Jamnagar", "Junagadh", "Anand", "Bharuch", "Porbandar", "Mehsana", "Morbi", "Nadiad", "Gandhidham", "Surendranagar", "Valsad", "Navsari", "Gandeva", "Dahod", "Veraval", "Palanpur", "Patan", "Anjar", "Bhuj", "Bilimora", "Narmada", "Godhra", "Botad", "Dhoraji", "Jetpur", "Deesa", "Kadi", "Vyara", "Lunawada", "Pardi", "Unjha", "Vijapur", "Sihor"});
        cityData.put("Haryana", new String[] { " ","Faridabad", "Gurgaon" , "Rohtak", "Panipat", "Yamunanagar", "Ambala", "Karnal", "Hisar", "Sirsa", "Bhiwani", "Bahadurgarh", "Jind", "Thanesar", "Kaithal", "Sonipat", "Panchkula", "Fatehabad", "Tohana", "Narnaul", "Hansi", "Narwana", "Ladwa", "Palwal", "Charkhi Dadri", "Jagadhri", "Nuh", "Safidon", "Ellenabad", "Kosli", "Shahbad", "Meham", "Rewari", "Gohana", "Indri"});
        cityData.put("Himachal Pradesh", new String[] { " ","Shimla", "Manali", "Dharamshala", "Mandi", "Solan", "Palampur", "Kullu", "Nahan", "Sirmaur", "Chamba", "Bilaspur", "Hamirpur", "Una", "Kangra", "Sundernagar", "Baddi", "Parwanoo", "Kasauli", "Rampur", "Keylong", "Lahaul and Spiti", "Dalhousie", "Kalpa", "Kinnaur"});
        cityData.put("Jharkhand", new String[] { " ","Ranchi", "Jamshedpur", "Dhanbad", "Bokaro Steel City", "Deoghar", "Hazaribagh", "Giridih", "Ramgarh", "Dumka", "Chaibasa", "Phusro", "Medininagar (Daltonganj)", "Chirkunda", "Jhumri Tilaiya", "Saunda", "Sahibganj", "Pakaur", "Chandrapura", "Madhupur", "Saraikela", "Gumia", "Simdega", "Lohardaga", "Piparwar", "Patratu", "Mihijam", "Jharia", "Godda", "Tenu Dam-cum- Kathhara", "Ghatshila", "Khunti", "Bundu", "Mango", "Sijua"});
        cityData.put("Karnataka", new String[] { " ","Bangalore", "Mysore" , "Hubli-Dharwad", "Mangalore", "Belgaum", "Gulbarga", "Davanagere", "Bellary", "Bijapur", "Shimoga", "Tumkur", "Raichur", "Bidar", "Hospet", "Hassan", "Gadag-Betigeri", "Udupi", "Robertson Pet", "Bagalkot", "Gangawati", "Ranibennur", "Karwar", "Yadgir", "Sirsi", "Jamkhandi", "Bhatkal", "Gokak", "Nipani", "Adyar", "Karwar", "Krishnarajpet"});
        cityData.put("Kerala", new String[] { " ","Thiruvananthapuram", "Kochi" , "Kozhikode" , "Thrissur", "Kollam", "Kottayam", "Palakkad", "Alappuzha", "Malappuram", "Kannur", "Pathanamthitta", "Aluva", "Changanassery", "Kanhangad", "Neyyattinkara", "Kasaragod", "Adoor", "Perinthalmanna", "Thalassery", "Ponnani", "Cherthala", "Ottapalam", "Vatakara", "Payyanur", "Kayamkulam", "Muvattupuzha", "Wadakkanchery", "Kalamassery", "Punalur", "Kodungallur", "Pala", "Mattannur"});
        cityData.put("Madhya Pradesh", new String[] { " ","Bhopal", "Indore", "Jabalpur", "Gwalior", "Ujjain", "Sagar", "Dewas", "Satna", "Ratlam", "Rewa", "Murwara (Katni)", "Singrauli", "Burhanpur", "Khandwa", "Bhind", "Chhindwara", "Guna", "Shivpuri", "Vidisha", "Damoh", "Mandsaur", "Khargone", "Neemuch", "Pithampur", "Hoshangabad", "Itarsi", "Sehore", "Betul", "Seoni", "Datia", "Nagda", "Sarni", "Harda"});
        cityData.put("Maharashtra", new String[] { " ","Mumbai" , "Pune", "Nagpur", "Thane", "Nashik", "Kalyan-Dombivali", "Vasai-Virar", "Aurangabad", "Solapur", "Bhiwandi", "Amravati", "Nanded", "Kolhapur", "Sangli", "Jalgaon", "Akola", "Latur", "Dhule", "Ahmednagar", "Ichalkaranji", "Chandrapur", "Parbhani", "Jalna", "Bhusawal", "Navi Mumbai", "Panvel", "Satara", "Beed", "Osmanabad", "Nandurbar", "Yavatmal", "Wardha", "Achalpur"});
        cityData.put("Manipur", new String[] { " ","Imphal" , "Thoubal", "Bishnupur", "Kakching", "Ukhrul", "Churachandpur", "Senapati", "Chandel", "Tamenglong", "Moirang", "Lilong", "Mayang Imphal", "Kumbi", "Kwakta", "Wangjing", "Nambol", "Jiribam", "Noney", "Mao", "Haflong", "Henglep"});
        cityData.put("Meghalaya", new String[] { " ","Shillong" , "Tura", "Jowai", "Nongstoin", "Baghmara", "Williamnagar", "Mairang", "Nongpoh", "Resubelpara", "Mawkyrwat", "Amlarem", "Khliehriat", "Khonjoy", "Nongbah", "Nongsteng", "Nongjri", "Kharkutta", "Ranikor", "Mawphlang", "Mawsynram"});
        cityData.put("Mizoram", new String[] { " ","Aizawl" , "Lunglei", "Saiha", "Champhai", "Kolasib", "Serchhip", "Lawngtlai", "Mamit", "Khawzawl", "Hnahthial"});
        cityData.put("Nagaland", new String[] { " ","Kohima" , "Dimapur", "Mokokchung", "Tuensang", "Wokha", "Mon", "Phek", "Zunheboto", "Longleng"});
        cityData.put("Odisha", new String[] { " ","Bhubaneswar", "Cuttack", "Rourkela", "Berhampur", "Puri", "Sambalpur", "Balasore", "Brahmapur", "Bhadrak", "Baripada", "Jharsuguda", "Bhawanipatna", "Rayagada", "Angul", "Balangir", "Dhenkanal", "Kendujhar", "Jajpur", "Sunabeda", "Bargarh", "Paradip", "Byasanagar", "Gunupur", "Koraput", "Titlagarh", "Bhawanipatna", "Jeypore", "Nabarangpur", "Parlakhemundi"});
        cityData.put("Punjab", new String[] { " ","Chandigarh" , "Ludhiana", "Amritsar", "Jalandhar", "Patiala", "Bathinda", "Hoshiarpur", "Mohali", "Batala", "Pathankot", "Moga", "Firozpur", "Kapurthala", "Faridkot", "Gurdaspur", "Sangrur", "Khanna", "Rajpura", "Mansa", "Muktsar", "Phagwara", "Fatehgarh Sahib", "Abohar", "Fazilka", "Nabha", "Barnala", "Goraya", "Rupnagar (Ropar)", "Tarn Taran", "Sri Muktsar Sahib", "Sunam"});
        cityData.put("Rajasthan", new String[] { " ","Jaipur" , "Jodhpur", "Udaipur", "Kota", "Ajmer", "Bikaner", "Sikar", "Alwar", "Bharatpur", "Pali", "Sri Ganganagar", "Jhunjhunu", "Kishangarh", "Tonk", "Beawar", "Barmer", "Sawai Madhopur", "Nagaur", "Hanumangarh", "Churu", "Dausa", "Hindaun", "Sikar", "Lachhmangarh", "Dungarpur", "Banswara", "Ratangarh", "Chittorgarh", "Nokha", "Didwana", "Nimbahera", "Rawatbhata"});
        cityData.put("Sikkim", new String[] { " ","Jaipur", "Jodhpur", "Udaipur", "Kota", "Ajmer", "Bikaner", "Sikar", "Alwar", "Bharatpur", "Pali", "Sri Ganganagar", "Jhunjhunu", "Kishangarh", "Tonk", "Beawar", "Barmer", "Sawai Madhopur", "Nagaur", "Hanumangarh", "Churu", "Dausa", "Hindaun", "Sikar", "Lachhmangarh", "Dungarpur", "Banswara", "Ratangarh", "Chittorgarh", "Nokha", "Didwana", "Nimbahera", "Rawatbhata"});
        cityData.put("Telangana", new String[] { " ","Hyderabad" , "Warangal", "Nizamabad", "Karimnagar", "Ramagundam", "Khammam", "Mahbubnagar", "Nalgonda", "Adilabad", "Suryapet", "Siddipet", "Miryalaguda", "Jagtial", "Nirmal", "Kollapur", "Mancherial", "Bhongir", "Wanaparthy", "Bodhan", "Kamareddy", "Jangaon", "Bhadrachalam", "Mahabubabad", "Jadcherla", "Kothagudem", "Palwancha", "Narayanpet", "Vikarabad", "Medak", "Sircilla", "Banswada"});
        cityData.put("Tripura", new String[] { " ","Agartala" , "Udaipur", "Dharmanagar", "Kailasahar", "Belonia", "Sabroom", "Amarpur", "Khowai", "Sonamura", "Bishramganj", "Kamalpur", "Santirbazar", "Ambassa", "Mohanpur", "Jirania", "Khowai", "Gakulnagar", "Teliamura", "Melaghar", "Manu"});
        cityData.put("Uttarakhand", new String[] { " ","Dehradun", "Haridwar", "Rishikesh", "Nainital", "Mussoorie", "Roorkee", "Haldwani", "Kashipur", "Rudrapur", "Udham Singh Nagar", "Almora", "Pithoragarh", "Chamoli", "Tehri", "Srinagar", "Rudraprayag", "Gopeshwar", "Bageshwar", "Pauri", "Kotdwar", "Lansdowne", "Joshimath", "Badrinath", "Kedarnath", "Gangotri", "Yamunotri", "Champawat", "Didihat", "Jaspur", "Barkot", "Devprayag", "Gaurikund", "Lohaghat", "Ranikhet", "Naini Tal", "Pithoragarh", "Khatima", "Lalkuan"});
        cityData.put("Uttar Pradesh", new String[] { " ","Lucknow" , "Kanpur", "Agra", "Varanasi", "Meerut", "Prayagraj" , "Ghaziabad", "Noida", "Bareilly", "Moradabad", "Aligarh", "Saharanpur", "Gorakhpur", "Jhansi", "Muzaffarnagar", "Mathura", "Firozabad", "Budaun", "Bijnor", "Etawah", "Hapur", "Deoria", "Sultanpur", "Barabanki", "Bahraich", "Amroha", "Jaunpur", "Lakhimpur Kheri", "Sitapur", "Rampur", "Khurja", "Sambhal", "Fatehpur", "Faizabad", "Unnao", "Jaunpur", "Basti", "Orai", "Modinagar", "Mainpuri"});
        cityData.put("West Bengal", new String[] { " ","Kolkata" , "Howrah", "Asansol", "Siliguri", "Durgapur", "Bardhaman" , "English Bazar", "Baharampur" , "Krishnanagar", "Haldia", "Raiganj", "Balurghat", "Serampore", "Krishnanagar", "Medinipur", "Bankura", "Purulia", "Jalpaiguri", "Cooch Behar", "Habra", "Naihati", "Kharagpur", "Shantipur", "Bolpur", "Barasat", "Ranaghat", "Raghunathganj", "Dankuni", "Darjeeling", "Alipurduar", "Jangipur", "Mekliganj", "Pujali"});

      






        // Add more countries, states, and cities as needed
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String countryId = request.getParameter("countryId");
        String stateId = request.getParameter("stateId");

        StringBuilder options = new StringBuilder();
        if (countryId != null) {
            String[] states = stateData.get(countryId);
            if (states != null) {
                for (String state : states) {
                    options.append("<option>").append(state).append("</option>");
                }
            }
        } else if (stateId != null) {
            String[] cities = cityData.get(stateId);
            if (cities != null) {
                for (String city : cities) {
                    options.append("<option>").append(city).append("</option>");
                }
            }
        }

        response.setContentType("text/html");
        response.getWriter().write(options.toString());
    }
}

