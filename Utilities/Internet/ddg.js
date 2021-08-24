const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
  })
  
  readline.question(`Search for something`, name => {
console.log("Connecting to Duckduckgo Servers...")
ddg.query(name, function(err, data){
    if (name.toLowerCase() == "google") {
        console.log("So let me get this straight. You went out of your way just to find this damn \"OS\" (when reality, it's just a lot of batch files.. and some other javascript) Just to search for google on this quote on quote \"search engine\".\nCouldn't you just... use your browser? Like... C'mon!\n\n\nOh that's right... you are a normie.\n\n")
    }
	results = data.RelatedTopics; //related topics is a list of 'related answers'
    console.log("Results:")
	for (i=0;i<results.length;i++) {
		console.log(''+results[i].FirstURL)
		console.log('-- '+results[i].Text)
		console.log('\n')
	}
});
    readline.close()
    process.exit()
  })