# Hacking with The Blue Alliance 

Another year, another FRC Season. I'm currently in the Tecbot 3158 First 
Robotics Competition, a great way in which students of all STEM fields can
show their abilities through teamwork. 

Right now, I'm in the engineering part. My job, for now, is to gather scouting
data for our team to analyze with maybe some ML models or just to make simple
statistics. 

## setup
Thankfully, TBA (*the blue alliance*) has a public read-access (and write, i 
believe) API, it's JSON and it lets you access almost everything. You just
have to sign in with google and get an API key. Now use any HTTP-GET
friendly request to retrieve data. Just remember to assign the HTTP header 
`X-TBA-Auth-Key` to the API key you receive.

### 
