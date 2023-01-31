#Can you please take the below code and make it work with the example code using the below code as the main section

extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var cards = Array()
var scards = Array()
var reusedcards = Array()
var discardpile = Array()
var discardpile2 = Array()
var cardspicked = Array()
var actual = Array()
var playerhanddiscard = Array()
var opponenthand = Array()
var opponenthanddiscard = Array()
var cardcount = 0
var handcount = 0
var handcount2 = 0
var showcard = null
var cardn = Array()
var cardc = Array()
var s = Vector2()
var lightpic = preload("res://assets/light.png")
const cardscript = preload("res://cardname.gd")
var backofdeck = preload("res://images/deckback.png")
var inside = false
var selectedcard = null
var playedcard = null
var firstrow = false
var secondrow = false
var cycle = 0
var lastcycle = 0
var lastCardPlayed = 78
var lastCardPlayedmem = null
var lastcard = null
var currentCardPlayed = null
var trumps = false
var wands = false
var pentacles = false
var cups = false
var swords = false
var valid = false
var wildcard = false
var countme = true
var newGame = true
var history = null
var Opcc = false
var lastsuit = null
var lsuit = null
var currentsuit = null
var samesuit = false
var notinhandcount2 = true
var samerank = false
var opponentsamesuit = false
var opponentsamerank = false
var lastcardname = "none"
var playedcardname = "none"
var currentcardplayedname = "none"
var cardcountpluscycle = 0
var cardcountcycle = 0
var cardcounttotal = 0
var oppoenenthandcount = 0
var oppindex = null
var nocards = false
var player = 0
var firstplaythroughdeck = true



var deck = []
var discard_pile = []
var players = [1]
var current_player = 0
var current_suit = "hearts"
var current_trump_number = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	setCards()
	scards = shuffle(cards)
	#print(scards)
	s.x = 0.5
	s.y = 0.5
	#pass # Replace with function body.
	

func setCards():
	cards.append("00_Fool")
	cards.append("01_Magician")
	cards.append("02_High_Priestess")
	cards.append("03_Empress")
	cards.append("04_Emperor")
	cards.append("05_Hierophant")
	cards.append("06_Lovers")
	cards.append("07_Chariot")
	cards.append("08_Strength")
	cards.append("09_Hermit")
	cards.append("10_Wheel_of_Fortune")
	cards.append("11_Justice")
	cards.append("12_Hanged_Man")
	cards.append("13_Death")
	cards.append("14_Temperance")
	cards.append("15_Devil")
	cards.append("16_Tower")
	cards.append("17_Star")
	cards.append("18_Moon")
	cards.append("19_Sun")
	cards.append("20_Judgement")
	cards.append("21_World")
	cards.append("22_Ace_of_Wands")
	cards.append("23_Two_of_Wands")
	cards.append("24_Three_of_Wands")
	cards.append("25_Four_of_Wands")
	cards.append("26_Five_of_Wands")
	cards.append("27_Six_of_Wands")
	cards.append("28_Seven_of_Wands")
	cards.append("29_Eight_of_Wands")
	cards.append("30_Nine_of_Wands")
	cards.append("31_Ten_of_Wands")
	cards.append("32_Page_of_Wands")
	cards.append("33_Knight_of_Wands")
	cards.append("34_Queen_of_Wands")
	cards.append("35_King_of_Wands")
	cards.append("36_Ace_of_Pentacles")
	cards.append("37_Two_of_Pentacles")
	cards.append("38_Three_of_Pentacles")
	cards.append("39_Four_of_Pentacles")
	cards.append("40_Five_of_Pentacles")
	cards.append("41_Six_of_Pentacles")
	cards.append("42_Seven_of_Pentacles")
	cards.append("43_Eight_of_Pentacles")
	cards.append("44_Nine_of_Pentacles")
	cards.append("45_Ten_of_Pentacles")
	cards.append("46_Page_of_Pentacles")
	cards.append("47_Knight_of_Pentacles")
	cards.append("48_Queen_of_Pentacles")
	cards.append("49_King_of_Pentacles")
	cards.append("50_Ace_of_Cups")
	cards.append("51_Two_of_Cups")
	cards.append("52_Three_of_Cups")
	cards.append("53_Four_of_Cups")
	cards.append("54_Five_of_Cups")
	cards.append("55_Six_of_Cups")
	cards.append("56_Seven_of_Cups")
	cards.append("57_Eight_of_Cups")
	cards.append("58_Nine_of_Cups")
	cards.append("59_Ten_of_Cups")
	cards.append("60_Page_of_Cups")
	cards.append("61_Knight_of_Cups")
	cards.append("62_Queen_of_Cups")
	cards.append("63_King_of_Cups")
	cards.append("64_Ace_of_Swords")
	cards.append("65_Two_of_Swords")
	cards.append("66_Three_of_Swords")
	cards.append("67_Four_of_Swords")
	cards.append("68_Five_of_Swords")
	cards.append("69_Six_of_Swords")
	cards.append("70_Seven_of_Swords")
	cards.append("71_Eight_of_Swords")
	cards.append("72_Nine_of_Swords")
	cards.append("73_Ten_of_Swords")
	cards.append("74_Page_of_Swords")
	cards.append("75_Knight_of_Swords")
	cards.append("76_Queen_of_Swords")
	cards.append("77_King_of_Swords")
	cards.append("78_Back_of_Deck")
	
	actual.append(preload("res://images/deck/00_Fool.png"))
	actual.append(preload("res://images/deck/01_Magician.png"))
	actual.append(preload("res://images/deck/02_High_Priestess.png"))
	actual.append(preload("res://images/deck/03_Empress.png"))
	actual.append(preload("res://images/deck/04_Emperor.png"))
	actual.append(preload("res://images/deck/05_Hierophant.png"))
	actual.append(preload("res://images/deck/06_Lovers.png"))
	actual.append(preload("res://images/deck/07_Chariot.png"))
	actual.append(preload("res://images/deck/08_Strength.png"))
	actual.append(preload("res://images/deck/09_Hermit.png"))
	actual.append(preload("res://images/deck/10_Wheel_of_Fortune.png"))
	actual.append(preload("res://images/deck/11_Justice.png"))
	actual.append(preload("res://images/deck/12_Hanged_Man.png"))
	actual.append(preload("res://images/deck/13_Death.png"))
	actual.append(preload("res://images/deck/14_Temperance.png"))
	actual.append(preload("res://images/deck/15_Devil.png"))
	actual.append(preload("res://images/deck/16_Tower.png"))
	actual.append(preload("res://images/deck/17_Star.png"))
	actual.append(preload("res://images/deck/18_Moon.png"))
	actual.append(preload("res://images/deck/19_Sun.png"))
	actual.append(preload("res://images/deck/20_Judgement.png"))
	actual.append(preload("res://images/deck/21_World.png"))
	actual.append(preload("res://images/deck/22_Ace_of_Wands.png"))
	actual.append(preload("res://images/deck/23_Two_of_Wands.png"))
	actual.append(preload("res://images/deck/24_Three_of_Wands.png"))
	actual.append(preload("res://images/deck/25_Four_of_Wands.png"))
	actual.append(preload("res://images/deck/26_Five_of_Wands.png"))
	actual.append(preload("res://images/deck/27_Six_of_Wands.png"))
	actual.append(preload("res://images/deck/28_Seven_of_Wands.png"))
	actual.append(preload("res://images/deck/29_Eight_of_Wands.png"))
	actual.append(preload("res://images/deck/30_Nine_of_Wands.png"))
	actual.append(preload("res://images/deck/31_Ten_of_Wands.png"))
	actual.append(preload("res://images/deck/32_Page_of_Wands.png"))
	actual.append(preload("res://images/deck/33_Knight_of_Wands.png"))
	actual.append(preload("res://images/deck/34_Queen_of_Wands.png"))
	actual.append(preload("res://images/deck/35_King_of_Wands.png"))
	actual.append(preload("res://images/deck/36_Ace_of_Pentacles.png"))
	actual.append(preload("res://images/deck/37_Two_of_Pentacles.png"))
	actual.append(preload("res://images/deck/38_Three_of_Pentacles.png"))
	actual.append(preload("res://images/deck/39_Four_of_Pentacles.png"))
	actual.append(preload("res://images/deck/40_Five_of_Pentacles.png"))
	actual.append(preload("res://images/deck/41_Six_of_Pentacles.png"))
	actual.append(preload("res://images/deck/42_Seven_of_Pentacles.png"))
	actual.append(preload("res://images/deck/43_Eight_of_Pentacles.png"))
	actual.append(preload("res://images/deck/44_Nine_of_Pentacles.png"))
	actual.append(preload("res://images/deck/45_Ten_of_Pentacles.png"))
	actual.append(preload("res://images/deck/46_Page_of_Pentacles.png"))
	actual.append(preload("res://images/deck/47_Knight_of_Pentacles.png"))
	actual.append(preload("res://images/deck/48_Queen_of_Pentacles.png"))
	actual.append(preload("res://images/deck/49_King_of_Pentacles.png"))
	actual.append(preload("res://images/deck/50_Ace_of_Cups.png"))
	actual.append(preload("res://images/deck/51_Two_of_Cups.png"))
	actual.append(preload("res://images/deck/52_Three_of_Cups.png"))
	actual.append(preload("res://images/deck/53_Four_of_Cups.png"))
	actual.append(preload("res://images/deck/54_Five_of_Cups.png"))
	actual.append(preload("res://images/deck/55_Six_of_Cups.png"))
	actual.append(preload("res://images/deck/56_Seven_of_Cups.png"))
	actual.append(preload("res://images/deck/57_Eight_of_Cups.png"))
	actual.append(preload("res://images/deck/58_Nine_of_Cups.png"))
	actual.append(preload("res://images/deck/59_Ten_of_Cups.png"))
	actual.append(preload("res://images/deck/60_Page_of_Cups.png"))
	actual.append(preload("res://images/deck/61_Knight_of_Cups.png"))
	actual.append(preload("res://images/deck/62_Queen_of_Cups.png"))
	actual.append(preload("res://images/deck/63_King_of_Cups.png"))
	actual.append(preload("res://images/deck/64_Ace_of_Swords.png"))
	actual.append(preload("res://images/deck/65_Two_of_Swords.png"))
	actual.append(preload("res://images/deck/66_Three_of_Swords.png"))
	actual.append(preload("res://images/deck/67_Four_of_Swords.png"))
	actual.append(preload("res://images/deck/68_Five_of_Swords.png"))
	actual.append(preload("res://images/deck/69_Six_of_Swords.png"))
	actual.append(preload("res://images/deck/70_Seven_of_Swords.png"))
	actual.append(preload("res://images/deck/71_Eight_of_Swords.png"))
	actual.append(preload("res://images/deck/72_Nine_of_Swords.png"))
	actual.append(preload("res://images/deck/73_Ten_of_Swords.png"))
	actual.append(preload("res://images/deck/74_Page_of_Swords.png"))
	actual.append(preload("res://images/deck/75_Knight_of_Swords.png"))
	actual.append(preload("res://images/deck/76_Queen_of_Swords.png"))
	actual.append(preload("res://images/deck/77_King_of_Swords.png"))
	actual.append(preload("res://images/deckbackrsize.png"))

func shuffle(cardsy):
		# fisher-yates shuffle: given array with elements 0..n, 
		# for each index i from n down to 1, pick a random index j 
		# and swap elements at i and j.
		
		#var i
		var j
		var tmp
		#i = cardsy.length() - 1
		#for n in range(10,-1,-1):
		#print(n)
		for i in range(cardsy.size() - 1,0,-1):
		#for (i = this.deck.length - 1; i > 0; i--) {
		
			randomize()
			#var rando = randi() % 77
			#j = Math.floor(Math.random() * (i + 1));
			j = floor(randf() * (i + 1));
			tmp = cardsy[i]#this.deck[i];
			cardsy[i] = cardsy[j]
			cardsy[j] = tmp
			#this.deck[i] = this.deck[j];
			#this.deck[j] = tmp;
		return cardsy

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#func _init():
	# Initialize deck, players, and discard pile
	#pass
	

	if (cardcount == 78 && firstplaythroughdeck):
		firstplaythroughdeck = false
		scards = discardpile.duplicate()
		shuffle(scards)
		cardcount = 0
		discardpile.clear()
	elif (cardcount == len(scards)-1):
		scards = discardpile.duplicate()
		shuffle(scards)
		cardcount = 0
		discardpile.clear()
		#cardcount = 0
		#setCards()
		#scards = shuffle(cards)
		##print(scards)
		#cardn = scards
		##print(cardn)
		##print(":cardn")
		s.x = 0.5
		s.y = 0.5
		cycle = cycle + 1
#	#if (lastcycle < cycle):
#	#	scards = shuffle(cards)
#	#	print(scards)
#	#	s.x = 0.5
#	#	s.y = 0.5
#	#	lastcycle = cycle
#		#cardn = scards
#		if cycle > 0:
#			cardcountpluscycle = cardcount + (77 * cycle)
#			#messing with 77 or 78 for this
#		reusedcards = shuffle(discardpile)
			
	
	if Input.is_action_just_released("mouseleft") && inside == false && cycle == 0:
		##player = next_turn()
		##print("player - is - " + String(player))
		#add to player hand somehow
		if cardcount < len(scards):
			if len(scards[cardcount]) >= 2: #.length() >= 2:
				showcard = scards[cardcount].substr(0,2).to_int()
			else:
				showcard = scards[cardcount].substr(0,1).toinst()
		if cardcount == len(scards):
			print("No cards currently available%%%%%%%%%%%%%%%%%%%%%%%%%%%No cards currently available%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
		

		#showcard = scards[cardcount].substr(0,2).to_int()#alredy called.
		###print(String(showcard) + " " + scards[cardcount])
		get_node("Sprite").texture = actual[showcard]
		get_node("Label").text = scards[cardcount]
		get_node("Label2").text = String(cardcount)
		
		cardn.append(TextureRect.new())
		#if cycle == 1:
		#	cardcount = cardcount + 78
		#if(cardn != null):
		if (cardn[cardcounttotal] != null):
			cardn[cardcounttotal].set_script(cardscript)
		###################################################################################################
		var lighter = Light2D.new()
		lighter.hide()
		lighter.set_name("lighter")
		lighter.texture = lightpic
		lighter.position.x = 40
		lighter.position.y = 70
		lighter.scale = s
		#cardc.append(Control.new())
		cardn[cardcounttotal].set_name("card" + String(cardcounttotal))#######################################################maybeuse cardcountcycle here
		
		#scards discard resued logic is needed
		cardn[cardcounttotal].cardname = scards[cardcount]########?????????????????????????????????????not sure about cardcount
		#cardc[cardcount].set_name("cardc" + String(cardcount))
		#cardn[cardcount].texture = actual[showcard] #
		cardn[cardcounttotal].texture = get_resized_texture(actual[showcard],80,140)
		
		
		#cardn[cardcount].set_stretch_mode(3)
		#cardn[cardcount].set_expand(true)
		#cardn[cardcount].set_scale(s)
		####print(cardn[cardcount].get_scale())
		
		#cardn[cardcount].set_custom_minimum_size(s)
		#cardn[cardcount].minimum_size_changed()
		#cardn[cardcount].rect_scale = Vector2(0.5,0.5)#s
		#cardn[cardcount].apply_scale(s)
		#cardn[cardcount].set_size(s)
		#cardn[cardcount].scale = .5

		#####print(cardn[cardcount].name)
		
		#LCPlayedStart(currentCardPlayed)
		#cardn[cardcount].connect("mouse_entered", self, cardn[cardcount].entered_mouse())
		cardn[cardcounttotal].connect("mouse_entered", cardn[cardcounttotal], "entered_mouse") 
		cardn[cardcounttotal].connect("mouse_exited", cardn[cardcounttotal] ,"exited_mouse")

		#for n in range(cardcount):
		#var pos = get_node("Control").get_global_rect().get_size().x / (cardcount + 1)
		#cardn[cardcount].position.x = pos
		#cardn[cardcount].position.y = get_node("Control").get_global_rect().position.y
		#get_node("HBoxContainer").add_child(cardc[cardcount])
		#get_node("HBoxContainer/cardc" + String(cardcount)).add_child(cardn[cardcount])

		if handcount < 20:
			if(get_node("HBoxContainer") != null):
				get_node("HBoxContainer").add_child(cardn[cardcounttotal])
			if(get_node("HBoxContainer/card" + String(cardcounttotal)) != null):
				get_node("HBoxContainer/card" + String(cardcounttotal)).add_child(lighter)
			notinhandcount2 = true
			handcount = handcount + 1
			#get_node("HBoxContainer/card" + String(cardcount)).connect("mouse_entered", self, get_node("HBoxContainer/card" + String(cardcount)).entered_mouse())
		elif handcount >= 20 && handcount2 < 20: # && cycle == 0:
			if(get_node("HBoxContainer2") != null):
				get_node("HBoxContainer2").add_child(cardn[cardcounttotal])
			if(get_node("HBoxContainer2/card" + String(cardcounttotal)) != null):
				get_node("HBoxContainer2/card" + String(cardcounttotal)).add_child(lighter)
				notinhandcount2 = false
			handcount2 = handcount2 + 1


#		if handcount < 20 && cycle > 0:
#			if(get_node("HBoxContainer") != null):
#				get_node("HBoxContainer").add_child(cardn[cardcount])
#			if(get_node("HBoxContainer/card" + String(cardcount)) != null):
#				get_node("HBoxContainer/card" + String(cardcount)).add_child(lighter)
#			handcount = handcount + 1
#			#get_node("HBoxContainer/card" + String(cardcount)).connect("mouse_entered", self, get_node("HBoxContainer/card" + String(cardcount)).entered_mouse())
#		elif handcount >= 20 && handcount2 < 20 && cycle > 0:
#			if(get_node("HBoxContainer2") != null):
#				get_node("HBoxContainer2").add_child(cardn[cardcount])
#			if(get_node("HBoxContainer2/card" + String(cardcount)) != null):
#				get_node("HBoxContainer2/card" + String(cardcount)).add_child(lighter)
#			handcount2 = handcount2 + 1			
#################**********************************************************************************************			
#			
#		if handcount < 20:
#			if(get_node("HBoxContainer") != null):
#				get_node("HBoxContainer").add_child(cardn[cardcount])
#			if(get_node("HBoxContainer/card" + String(cardcount) + String(cycle)) != null):
#				get_node("HBoxContainer/card" + String(cardcount) + String(cycle)).add_child(lighter)
#			handcount = handcount + 1
			#get_node("HBoxContainer/card" + String(cardcount)).connect("mouse_entered", self, get_node("HBoxContainer/card" + String(cardcount)).entered_mouse())
#		elif handcount >= 20 && handcount2 < 20:
#			if(get_node("HBoxContainer2") != null):
#				get_node("HBoxContainer2").add_child(cardn[cardcount])
#			if(get_node("HBoxContainer2/card" + String(cardcount) + String(cycle)) != null):
#				get_node("HBoxContainer2/card" + String(cardcount) + String(cycle)).add_child(lighter)
				
							
		#get_node("HBoxContainer/card0").set_scale(s)
		#print(cardn[cardcount].name)
			#get_node("HBoxContainer").add_spacer(true)

		#if (newGame == true):
			#LCPlayedStart(currentCardPlayed)
			#lastCardPlayed = currentCardPlayed
		#LCPlayedSuitSet()
			#newGame = false
			
		#if (countme == true):
		#if (Opcc == false):
		cardcount = cardcount + 1
		cardcounttotal = cardcounttotal + 1
			#countme = false

		
			#string.substr(0,3).to_int()
		# do something
	elif Input.is_action_just_released("mouseleft") && inside == false && cycle > 0:
#		if(nocards):
#			#DO nothing but display no cards
#		else:

		if cardcount < len(scards):
			if len(scards[cardcount]) >= 2: #.length() >= 2:
				showcard = scards[cardcount].substr(0,2).to_int()
			else:
				showcard = scards[cardcount].substr(0,1).toinst()
			nocards = false
		if cardcount == len(scards):
			print("No cards currently available%%%%%%%%%%%%%%%%%%%%%%%%%%%No cards currently available%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% show deck back at 78")
			nocards = true
			showcard == 78
		#showcard = scards[cardcount].substr(0,2).to_int()# replace with if else statement
		###print(String(showcard) + " " + scards[cardcount])
		if nocards:
			print("No more cards in deck, wait until cards are played.")
			#opponentPlayCard()
			#nocards == false
		else:
			get_node("Sprite").texture = actual[showcard]
			get_node("Label").text = scards[cardcount]
			get_node("Label2").text = String(cardcount)
			
	
			cardn.append(TextureRect.new())
			if (cardn[cardcounttotal] != null):
				cardn[cardcounttotal].set_script(cardscript)
			###################################################################################################
			var lighter = Light2D.new()
			lighter.hide()
			lighter.set_name("lighter")
			lighter.texture = lightpic
			lighter.position.x = 40
			lighter.position.y = 70
			lighter.scale = s
	
			cardn[cardcounttotal].set_name("card" + String(cardcounttotal))
			cardn[cardcounttotal].cardname = scards[cardcount]   #use resuedcards or discard pile
			cardn[cardcounttotal].texture = get_resized_texture(actual[showcard],80,140)
			
			cardn[cardcounttotal].connect("mouse_entered", cardn[cardcounttotal], "entered_mouse") 
			cardn[cardcounttotal].connect("mouse_exited", cardn[cardcounttotal] ,"exited_mouse")
			
			if handcount < 20:
				if(get_node("HBoxContainer") != null):
					#get_node("HBoxContainer/card" + String(cardcount)).show()
					get_node("HBoxContainer").add_child(cardn[cardcounttotal])
				if(get_node("HBoxContainer/card" + String(cardcounttotal)) != null):
					get_node("HBoxContainer/card" + String(cardcounttotal)).add_child(lighter)#get_node("HBoxContainer").add_child(cardn[cardcount])
				#if(get_node("HBoxContainer/card" + String(cardcount)) != null):
				#	get_node("HBoxContainer/card" + String(cardcount)).add_child(lighter)
				handcount = handcount + 1
				#get_node("HBoxContainer/card" + String(cardcount)).connect("mouse_entered", self, get_node("HBoxContainer/card" + String(cardcount)).entered_mouse())
				notinhandcount2 = true
			elif handcount >= 20 && handcount2 < 20:
				if(get_node("HBoxContainer2") != null):
					#get_node("HBoxContainer2/card" + String(cardcount)).show()
					get_node("HBoxContainer2").add_child(cardn[cardcounttotal])
				if(get_node("HBoxContainer2/card" + String(cardcounttotal)) != null):
					get_node("HBoxContainer2/card" + String(cardcounttotal)).add_child(lighter)
					#get_node("HBoxContainer2").add_child(cardn[cardcount])
				#if(get_node("HBoxContainer2/card" + String(cardcount)) != null):
				#	get_node("HBoxContainer2/card" + String(cardcount)).add_child(lighter)
				handcount2 = handcount2 + 1
				notinhandcount2 = false
	
			else:
				pass

		cardcount = cardcount + 1
		cardcounttotal = cardcounttotal + 1


		
		
		
		
				
	if Input.is_action_just_released("mouseleft") && inside && firstrow:
		##player = next_turn()
		##print("player - is - " + String(player))
		#discardpile.append(selectedcard.cardname)
		lastcard = playedcard
		lastcardname = playedcardname
		#if playedcard != null:
		#	lastcard = playedcard
		#	#playedcard = get_node("HBoxContainer/" + selectedcard).cardname.substr(0,2).to_int()
		#else:
		#	lastcard = 78
		if has_node("HBoxContainer/" + selectedcard):
#		if(get_node("HBoxContainer/" + selectedcard).cardname == null):
##		if(get_node("HBoxContainer/" + selectedcard) == null):	
#			pass
#		else:
			#if ((get_node("HBoxContainer/") + selectedcard) != null):
			print("played card " + get_node("HBoxContainer/" + selectedcard).cardname)
			playedcard = get_node("HBoxContainer/" + selectedcard).cardname.substr(0,2).to_int()
			#playedcardname = 
			playedcardname = get_node("HBoxContainer/" + selectedcard).cardname
			if currentCardPlayed != null:
				lastCardPlayed = currentCardPlayed
			currentCardPlayed = get_node("HBoxContainer/" + selectedcard).cardname.substr(0,2).to_int()
			currentcardplayedname = get_node("HBoxContainer/" + selectedcard).cardname
			get_node("Sprite2").texture = actual[playedcard]
			###print(get_node("HBoxContainer/" + selectedcard).cardname.substr(0,2).to_int())
			discardpile.append(get_node("HBoxContainer/" + selectedcard).cardname)
			#discardpile2.append(get_node("HBoxContainer/" + selectedcard))
			####playerhand.append(cardn[cardcounttotal])
			playerhanddiscard.append((get_node("HBoxContainer/" + selectedcard).cardname))
			print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^")
			print("************** player hand discard ****************")
			print(playerhanddiscard)
			reusedcards.append(get_node("HBoxContainer/" + selectedcard))
			get_node("HBoxContainer/" + selectedcard).queue_free()#.hidewasusedhereforatry
			handcount = handcount - 1
			#print(currentCardPlayed)
			print("there here")
			lsuit = LCPlayedSuitCheck()
			RegularRankCheck()
			Opponent()


			#cardcount = cardcount + 1
			#lastCardPlayed = currentCardPlayed

		
	if Input.is_action_just_released("mouseleft") && inside && secondrow:
		##player = next_turn()
		##print("player - is - " + String(player))
		lastcard = playedcard
		lastcardname = playedcardname
#		if playedcard == null:
#			lastcard = playedcard
#			#playedcard = get_node("HBoxContainer/" + selectedcard).cardname.substr(0,2).to_int()
#		else:
#			lastcard = 78	
		if has_node("HBoxContainer2/" + selectedcard):
#		(get_node("HBoxContainer2/" + selectedcard).cardname == null):
##		if(get_node("HBoxContainer2/" + selectedcard) == null):	
#			pass
#		else:
		#if(get_node("HBoxContainer2/" + selectedcard).cardname != null):
		#if(get_node("HBoxContainer2/" + selectedcard).cardname):
			#if ((get_node("HBoxContainer2/" + selectedcard).cardname) != null):
			print("played card" + get_node("HBoxContainer2/" + selectedcard).cardname)
			playedcard = get_node("HBoxContainer2/" + selectedcard).cardname.substr(0,2).to_int()
			playedcardname = get_node("HBoxContainer2/" + selectedcard).cardname
			if currentCardPlayed != null:
				lastCardPlayed = currentCardPlayed
			currentCardPlayed = get_node("HBoxContainer2/" + selectedcard).cardname.substr(0,2).to_int()
			currentcardplayedname = get_node("HBoxContainer2/" + selectedcard).cardname
			get_node("Sprite2").texture = actual[playedcard]
			###print(get_node("HBoxContainer2/" + selectedcard).cardname.substr(0,2).to_int())
			discardpile.append(get_node("HBoxContainer2/" + selectedcard).cardname)
			#discardpile2.append(get_node("HBoxContainer2/" + selectedcard))
			playerhanddiscard.append((get_node("HBoxContainer2/" + selectedcard).cardname))
			print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^")
			print("************** player hand discard ****************")
			print(playerhanddiscard)#maybe should be different variable name since this is selected card something or other start here !!!!!!!!!!!!!!!!!!!!!!!!!!
			reusedcards.append(get_node("HBoxContainer2/" + selectedcard))
			get_node("HBoxContainer2/" + selectedcard).queue_free()
			handcount2 = handcount2 - 1
			#print(currentCardPlayed)
			print("there there")
			lsuit = LCPlayedSuitCheck()
			#if lsuit != null:
			RegularRankCheck()				
			Opponent()


		#cardcount = cardcount + 1
			#pass
		#lastCardPlayed = currentCardPlayed
#######################################################################################################################################################

###doubled the code to use with cyle variable

#####################################################################################################################################################	
#		
#	if Input.is_action_just_released("mouseleft") && inside && firstrow:
#		#discardpile.append(selectedcard.cardname)
#		lastcard = playedcard
#		#if playedcard != null:
#		#	lastcard = playedcard
#		#	#playedcard = get_node("HBoxContainer/" + selectedcard).cardname.substr(0,2).to_int()
#		#else:
#		#	lastcard = 78
#		print("played card " + get_node("HBoxContainer/" + selectedcard).cardname)
#		playedcard = get_node("HBoxContainer/" + selectedcard).cardname.substr(0,2).to_int()
#		playedcardname = get_node("HBoxContainer/" + selectedcard).cardname
#		if currentCardPlayed != null:
#			lastCardPlayed = currentCardPlayed
#		currentCardPlayed = get_node("HBoxContainer/" + selectedcard).cardname.substr(0,2).to_int()
#		currentcardplayedname = get_node("HBoxContainer/" + selectedcard).cardname
#		get_node("Sprite2").texture = actual[playedcard]
#		###print(get_node("HBoxContainer/" + selectedcard).cardname.substr(0,2).to_int())
#		discardpile.append(get_node("HBoxContainer/" + selectedcard).cardname)
#		discardpile2.append(get_node("HBoxContainer/" + selectedcard))
#		playerhand.append((get_node("HBoxContainer/" + selectedcard)))
#		reusedcards.append(get_node("HBoxContainer/" + selectedcard))
#		get_node("HBoxContainer/" + selectedcard).queue_free()
#		handcount = handcount - 1
#		#print(currentCardPlayed)
#		print("there here")
#		lsuit = LCPlayedSuitCheck()
#		Opponent()
#		#cardcount = cardcount + 1
#		#lastCardPlayed = currentCardPlayed
#
#		
#	if Input.is_action_just_released("mouseleft") && inside && secondrow:
#		lastcard = playedcard
##		if playedcard == null:
##			lastcard = playedcard
##			#playedcard = get_node("HBoxContainer/" + selectedcard).cardname.substr(0,2).to_int()
##		else:
##			lastcard = 78
#		print("played card" + get_node("HBoxContainer2/" + selectedcard).cardname)
##		playedcard = get_node("HBoxContainer2/" + selectedcard).cardname.substr(0,2).to_int()
#		playedcardname = get_node("HBoxContainer2/" + selectedcard).cardname
#		if currentCardPlayed != null:
#			lastCardPlayed = currentCardPlayed
#		currentCardPlayed = get_node("HBoxContainer2/" + selectedcard).cardname.substr(0,2).to_int()
#		currentcardplayedname = get_node("HBoxContainer2/" + selectedcard).cardname
#		get_node("Sprite2").texture = actual[playedcard]
#		###print(get_node("HBoxContainer2/" + selectedcard).cardname.substr(0,2).to_int())
#		discardpile.append(get_node("HBoxContainer2/" + selectedcard).cardname)
#		discardpile2.append(get_node("HBoxContainer2/" + selectedcard))
#		playerhand.append((get_node("HBoxContainer2/" + selectedcard)))
#		reusedcards.append(get_node("HBoxContainer2/" + selectedcard))
#		get_node("HBoxContainer2/" + selectedcard).queue_free()
#		handcount2 = handcount2 -1
#		#print(currentCardPlayed)
#		print("there there")
#		lsuit = LCPlayedSuitCheck()
#		#if lsuit != null:
#			
#		Opponent()
#		#cardcount = cardcount + 1
#			#pass
#		#lastCardPlayed = currentCardPlayed


#func next_turn():
#	current_player += 1
#	if current_player >= len(players):
#		current_player = 0
#	return current_player
	
func next_turn() -> int:
	if(current_player == 1):
		current_player = 0
		return current_player
	else:
		current_player = 1
		return current_player
	

	
#	return current_player
func play_card(card):
	if card.suit == current_suit or card.rank == 8:
		players[current_player].play_card(card, discard_pile)
		current_suit = card.suit
		current_trump_number = -1
		#next_turn()
	elif card.trump == true:
		if card.trump_number > current_trump_number:
			#current_suit = get_suit_from_player()
			current_trump_number = card.trump_number
		elif card.trump_number < current_trump_number:
			#current_suit = get_random_suit()
			current_trump_number = card.trump_number
			
			

#func LCPlayedStart(currentCardPlayed):
#	lastCardPlayed = currentCardPlayed
	
func LCPlayedSuitCheck() -> String:
	print(currentCardPlayed)
	print("thats that")
	#lastCardPlayedmem = lastCardPlayed
	#lastCardPlayed = currentCardPlayed	
	#############################################
	
	#showcard = scards[playedcard].substr(0,2).to_int()
	#showcard = scards[currentCardPlayed].substr(0,2).to_int()
	#showcard = currentCardPlay
	if currentCardPlayed >= len(scards):
		print("Error: currentCardPlayed is out of bounds")
		return ""
	print(String(currentCardPlayed) + " " + scards[currentCardPlayed] + "+++++")
	if (currentCardPlayed <= 21):
		trumps = true
		print("trumps")
		wands = false
		pentacles = false
		cups = false
		swords = false
		currentsuit = "trumps"
	if (currentCardPlayed > 21 && currentCardPlayed <= 35):
		wands = true
		print("wands")
		trumps = false
		pentacles = false
		cups = false
		swords = false
		currentsuit = "wands"
	if (currentCardPlayed > 35 && currentCardPlayed <= 49):
		pentacles = true
		print("pentacles")
		trumps = false
		wands = false
		cups = false
		swords = false
		currentsuit = "pentacles"
	if(currentCardPlayed > 49 && currentCardPlayed <= 63):
		cups = true
		print("cups")
		trumps = false
		wands = false
		pentacles = false
		swords = false
		currentsuit = "cups"
	if(currentCardPlayed > 63 && currentCardPlayed <= 77):
		swords = true
		print("swords")
		trumps = false
		wands = false
		pentacles = false
		cups = false
		currentsuit = "swords"
	if(currentCardPlayed == 78):
		currentsuit = "none this is the deckback"
	print("currentsuit is ------> " + currentsuit)
	if lastsuit == null:
		lastsuit = currentsuit
	if lastsuit != null:
		if lastsuit == currentsuit:
			samesuit = true
			print("the suit is the same condition ::true::")
		else:
			samesuit = false
			print("the suit is not the same ::false::")
	lastsuit = currentsuit	
	
	#lastCardPlayed = currentCardPlayed
	return lastsuit
	

		
func RegularRankCheck():
	
#	print(currentCardPlayed)
#	print("thats that")
#	#lastCardPlayedmem = lastCardPlayed
#	#lastCardPlayed = currentCardPlayed	
#	#############################################
#	
#	#showcard = scards[playedcard].substr(0,2).to_int()
#	#showcard = scards[currentCardPlayed].substr(0,2).to_int()
#	#showcard = currentCardPlayed
#	print(String(currentCardPlayed) + " " + scards[currentCardPlayed] + "+++++")

##############################################
##This section of logic needs scrutiny      ##
## 											##
##											##
##											##
##############################################

	if(currentCardPlayed):
		if(lastcard):
			if (currentCardPlayed <= 21 && lastcard <= 21):
				#TrumpRank() depricated using a function for one if statement seems too much
				#do trump rank here
				if (currentCardPlayed > lastcard):
					pickSuit()
					currentsuit = "trumps - ranking just occured - current card greater than last card"
					print(currentsuit)
			if(currentCardPlayed > 21 && lastcard > 21):
				if (currentcardplayedname.substr(3,4) == lastcardname.substr(3,4)):
					samerank = true
					print("This is the current and last card rank match" + currentcardplayedname + " ------last-card-name------>>>" + lastcardname)
					print(currentcardplayedname.substr(3,4) + " ------  " + lastcardname.substr(3,4))
		else:
			if (currentCardPlayed <= 21):
				pickSuit()
	#pass
	
func TrumpRank():
	print("do trump rank here")
	#if(currentCardPlayed):
	#	if(lastcard <= 21):
	if (currentCardPlayed > lastcard):
		pickSuit()
	#pass
	
		
func Opponent():
#forreference add in later				discardpile.append(get_node("HBoxContainer/" + selectedcard).cardname)
	print("opponent:")
	if cardcount < len(scards):
		if len(scards[cardcount]) >= 2: #.length() >= 2:
			showcard = scards[cardcount].substr(0,2).to_int()
		else:
			showcard = scards[cardcount].substr(0,1).toinst()
		nocards = false
	if cardcount == len(scards):
			print("No cards currently available%%%%%%%%%%%%%%%%%%%%%%%%%%%No cards currently available%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
			nocards = true
			showcard == 78
	if nocards:
		print("No more cards in deck, wait until cards are played. Opponent Turn.")
		#opponentPlayCard()
	else:
	#showcard = scards[cardcount].substr(0,2).to_int()# replace with above code
	#print(String(showcard) + " - " + scards[cardcount])
	#lastcardname = scards[lastcard]#removinglasCardPlayed for showcard
	

	
	
		if (lastcard != null):
			get_node("Sprite3").texture = actual[lastcard]#showcard]
		####discardpile.append(lastcard)##########################################maybe this needs uncommented not sure
	#	get_node("Label3").text = lastcardname# scards[cardcount]#######################################################################################################
		get_node("Label3").text = ("blah" + playedcardname)#scards[lastCardPlayed]# scards[cardcount]#######################################################################################################
		get_node("Label4").text = String(cardcount)
		
		#get card for opponent
		#showcard = scards[cardcount].substr(0,2).to_int()#already called
		print(String(showcard) + " " + scards[cardcount])
		##########get_node("Sprite").texture = actual[showcard]
		get_node("Label").text = scards[cardcount]
		get_node("Label2").text = String(cardcount)
		#cardcount  = cardcount + 1
		#countme = false
		#pass
		#showcard = scards[cardcount].substr(0,2).to_int()#aleady called
		###print(String(showcard) + " " + scards[cardcount])
		get_node("Sprite4").texture = actual[showcard]
		get_node("Label5").text = scards[cardcount]
		get_node("Label6").text = String(cardcounttotal)
		var opponentmsg = "Your Oppenent Took a Card -" + scards[cardcount]
		get_node("Label7").text = opponentmsg
		get_node("Sprite4").texture = actual[showcard]
		cardn.append(TextureRect.new())
		if (cardn[cardcounttotal] != null):
			cardn[cardcounttotal].set_script(cardscript)
		###################################################################################################
		var lighter = Light2D.new()
		lighter.hide()
		lighter.set_name("lighter")
		lighter.texture = lightpic
		lighter.position.x = 40
		lighter.position.y = 70
		lighter.scale = s
	
		cardn[cardcounttotal].set_name("card" + String(cardcounttotal))#######################################################maybeuse cardcountcycle here
		cardn[cardcounttotal].cardname = scards[cardcount]
		cardn[cardcounttotal].texture = get_resized_texture(actual[showcard],80,140)
			
	
		cardn[cardcounttotal].connect("mouse_entered", cardn[cardcounttotal], "entered_mouse") 
		cardn[cardcounttotal].connect("mouse_exited", cardn[cardcounttotal] ,"exited_mouse")
	
		opponenthand.append(scards[cardcount])
		print("----------------------opponent-hand----------------------")
		print(opponenthand)
		print("----------------------opponent-hand-end------------------")
		cardcount = cardcount + 1
		cardcounttotal = cardcounttotal + 1
		get_node("Timer").start()
		#timer callso opponentPlayCard()
	
func opponentPlayCard():
		var oppygone = 0
		print("the opphand   ")

		for o in opponenthand:
			print("opponent hand is " + o)
		
		print("*******************************************look here for index, opponenthand[index]********************************")	
		for index in range(len(opponenthand)):
			print(index, opponenthand[index])
						
		for ophand in opponenthand:
			oppindex = ophand.substr(0,2).to_int()
				#checkrank
			if(oppindex > 21 && oppindex < 78):
				if (ophand.substr(3,4) == lastcardname.substr(3,4)):
					print("opponent play card for rank" + String(oppindex) + "  -- for card" + lastcardname + " and " + ophand)
					opponentsamerank = true
					get_node("Sprite2").texture = actual[oppindex]
					get_node("Label3").text = ophand#lastcardname#playedcardname#scards[cardcount]
					get_node("Label4").text = String(cardcount)
					discardpile.append(ophand)		
					print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
					for index in range(len(opponenthand)-1):
						print(index, opponenthand[index])
						if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
							opponenthand.remove(index)#opponenthand[index]
					break	
			#checksuit					
			if oppindex <= 21:
				#play the card
				print("I should play my TRUMP card!!!")
				get_node("Sprite2").texture = actual[oppindex]
				get_node("Label3").text = ophand#playedcardname#scards[cardcount]
				get_node("Label4").text = String(cardcount)
				discardpile.append(ophand)	
				print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
				for index in range(len(opponenthand)-1):
					print(index, opponenthand[index])
					if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
						opponenthand.remove(index)#opponenthand[index]
				break

			if (oppindex > 21 && oppindex <= 35 && lastsuit == "wands"):
				print("opponent play card for wands" + String(oppindex))
				opponentsamesuit = true
				#play the card
				get_node("Sprite2").texture = actual[oppindex]
				get_node("Label3").text = ophand#playedcardname# scards[cardcount]
				get_node("Label4").text = String(cardcount)
				discardpile.append(ophand)		
				print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
				for index in range(len(opponenthand)-1):
					print(index, opponenthand[index])
					if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
						opponenthand.remove(index)#opponenthand[index]
				break
			if(oppindex > 35 && oppindex <= 49 && lastsuit == "pentacles"):
				print("opponent play card for pentacles" + String(oppindex))
				opponentsamesuit = true
				get_node("Sprite2").texture = actual[oppindex]
				get_node("Label3").text = ophand#playedcardname# scards[cardcount]
				get_node("Label4").text = String(cardcount)
				discardpile.append(ophand)			
				print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
				for index in range(len(opponenthand)-1):
					print(index, opponenthand[index])
					if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
						opponenthand.remove(index)#opponenthand[index]
				break
				
			if (oppindex > 49 && oppindex <= 63 && lastsuit == "cups"):
				print("opponent play card for cups" + String(oppindex))
				opponentsamesuit = true	
				get_node("Sprite2").texture = actual[oppindex]
				get_node("Label3").text = ophand#playedcardname# scards[cardcount]
				get_node("Label4").text = String(cardcount)
				discardpile.append(ophand)
				print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
				for index in range(len(opponenthand)-1):
					print(index, opponenthand[index])
					if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
						opponenthand.remove(index)#opponenthand[index]
				break
				#play the card
				#pass
			if (oppindex > 63 && oppindex <= 77 && lastsuit =="swords"):	
				print("opponent play card for swords" + String(oppindex))
				opponentsamesuit = true
				get_node("Sprite2").texture = actual[oppindex]
				get_node("Label3").text = ophand#playedcardname# scards[cardcount]
				get_node("Label4").text = String(cardcount)
				discardpile.append(ophand)			
				print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
				for index in range(len(opponenthand)-1):
					print(index, opponenthand[index])
					if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
						opponenthand.remove(index)#opponenthand[index]
				break
			if(oppindex == 78):
				#currentsuit = "none this is the deckback"
				#print("currentsuit is ------> " + currentsuit)
				print("deckback")
		
			oppygone = oppygone + 1
			if(opponentsamesuit || opponentsamerank):
				break
		for o in opponenthand:
			print("new opponent hand is " + o)
		player = next_turn()				
				
		
func opponentPlayCardOriginal():
	##if (player == 1):
	#discardpile.append(get_node("HBoxContainer2/" + selectedcard).cardname)
	
	#if trump available play card
	#if same suit and same rank available randomize play between the two
	#if same rank play card
	#if same suit play card
	#othewise pick a card I guess or skip maybe?
	#add card to discadpile array
	#free card in array
		var oppygone = 0
		print("the opphand   ")
		#lcn = lastcardname.substr(0,2).to_int()
		for o in opponenthand:
			print("opponent hand is " + o)
		
		#for index, o in enumerate(opponenthand):
		#	print("opponent hand is " + o + " and the index is=" + String(index))
		#for index, item in enumerate(items):
			#	print(index, item)
		print("*******************************************look here for index, opponenthand[index]********************************")	
		for index in range(len(opponenthand)):
			print(index, opponenthand[index])
			
			
#			for index in range(len(items)):
#    print(index, items[index])
			
		for ophand in opponenthand:
			#checksuit
			oppindex = ophand.substr(0,2).to_int()
				#checkrank

			
			if(oppindex > 21 && oppindex < 78):
				if (ophand.substr(3,4) == lastcardname.substr(3,4)):
					print("opponent play card for rank" + String(oppindex) + "  -- for card" + lastcardname + " and " + ophand)
					opponentsamerank = true
					get_node("Sprite2").texture = actual[oppindex]
					get_node("Label3").text = ophand#lastcardname#playedcardname#scards[cardcount]
					get_node("Label4").text = String(cardcount)
					discardpile.append(ophand)		
					#remove_card(opponenthand, oppygone)	
					#opponenthand.remove(ophand)
					print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
					for index in range(len(opponenthand)):
						print(index, opponenthand[index])
						if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
							opponenthand.remove(ophand)#opponenthand[index]
					break	
							
#					for opped in opponenthand:
#						if (oppindex == opped.substr(0,2).to_int()):
#
#							opponenthand.remove(opped)
#							print("===========================removed)))))))))))))))))((((((((((((((((( ==" + opped)
					#next_turn()
					#break
					#play card of same rank
					#pass
					
			if oppindex <= 21:
				#play the card
				print("I should play my TRUMP card!!!")
				get_node("Sprite2").texture = actual[oppindex]
				get_node("Label3").text = ophand#playedcardname#scards[cardcount]
				get_node("Label4").text = String(cardcount)
				discardpile.append(ophand)	
				#remove_card(opponenthand, oppygone)	
				#opponenthand.remove(ophand)	
#				for opped in opponenthand:
#					if (oppindex == opped.substr(0,2).to_int()):
#						opponenthand.remove(opped)
#						print("===========================removed)))))))))))))))))((((((((((((((((( ==" + opped)

				print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
				for index in range(len(opponenthand)):
					print(index, opponenthand[index])
					if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
						opponenthand.remove(ophand)#opponenthand[index]
				break
				#next_turn()	
				###break				#maybeneed to break here
#			if oppindex <= 21:
#				#play the card
#				print("I should play my TRUMP card!!!")
#				get_node("Sprite2").texture = actual[oppindex]
#				get_node("Label3").text = playedcardname#scards[cardcount]
#				get_node("Label4").text = String(cardcount)
#				discardpile.append(ophand)	
#				opponenthand.remove(oppygone)	
#				next_turn()	
#				break
			if (oppindex > 21 && oppindex <= 35 && lastsuit == "wands"):
				print("opponent play card for wands" + String(oppindex))
				opponentsamesuit = true
				#play the card
				get_node("Sprite2").texture = actual[oppindex]
				get_node("Label3").text = ophand#playedcardname# scards[cardcount]
				get_node("Label4").text = String(cardcount)
				discardpile.append(ophand)			
				#remove_card(opponenthand, oppygone)
#				opponenthand.remove(ophand)
				print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
				for index in range(len(opponenthand)):
					print(index, opponenthand[index])
					if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
						opponenthand.remove(ophand)#opponenthand[index]
						
#				for opped in opponenthand:
#					if (oppindex == opped.substr(0,2).to_int()):
#						opponenthand.remove(opped)
#						print("===========================removed)))))))))))))))))((((((((((((((((( ==" + opped)
				#next_turn()
				break
				#pass
			if(oppindex > 35 && oppindex <= 49 && lastsuit == "pentacles"):
				print("opponent play card for pentacles" + String(oppindex))
				opponentsamesuit = true
				get_node("Sprite2").texture = actual[oppindex]
				get_node("Label3").text = ophand#playedcardname# scards[cardcount]
				get_node("Label4").text = String(cardcount)
				discardpile.append(ophand)			
				#remove_card(opponenthand, oppygone)
#				opponenthand.remove(ophand)
				print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
				for index in range(len(opponenthand)):
					print(index, opponenthand[index])
					if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
						opponenthand.remove(ophand)#opponenthand[index]
#				for opped in opponenthand:
#					if (oppindex == opped.substr(0,2).to_int()):
#						opponenthand.remove(opped)
#						print("===========================removed)))))))))))))))))((((((((((((((((( ==" + opped)
#				#next_turn()
				break
				#play the card
				#pass
				
			if (oppindex > 49 && oppindex <= 63 && lastsuit == "cups"):
				print("opponent play card for cups" + String(oppindex))
				opponentsamesuit = true	
				get_node("Sprite2").texture = actual[oppindex]
				get_node("Label3").text = ophand#playedcardname# scards[cardcount]
				get_node("Label4").text = String(cardcount)
				discardpile.append(ophand)
				#remove_card(opponenthand, oppygone)
#				opponenthand.remove(ophand)
				print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
				for index in range(len(opponenthand)):
					print(index, opponenthand[index])
					if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
						opponenthand.remove(ophand)#opponenthand[index]
#				for opped in opponenthand:
#					if (oppindex == opped.substr(0,2).to_int()):
#						opponenthand.remove(opped)
#						print("===========================removed)))))))))))))))))((((((((((((((((( ==" + opped)
#				#next_turn()
				break
				#play the card
				#pass
			if (oppindex > 63 && oppindex <= 77 && lastsuit =="swords"):	
				print("opponent play card for swords" + String(oppindex))
				opponentsamesuit = true
				get_node("Sprite2").texture = actual[oppindex]
				get_node("Label3").text = ophand#playedcardname# scards[cardcount]
				get_node("Label4").text = String(cardcount)
				discardpile.append(ophand)			
				#remove_card(opponenthand, oppygone)
#				opponenthand.remove(ophand)
				print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
				for index in range(len(opponenthand)):
					print(index, opponenthand[index])
					if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
						opponenthand.remove(ophand)#opponenthand[index]
#				for opped in opponenthand:
#					if (oppindex == opped.substr(0,2).to_int()):
#						opponenthand.remove(opped)
#						print("===========================removed)))))))))))))))))((((((((((((((((( ==" + opped)
				#next_turn()
				break
				#play the card
				#pass
			#else:
			if(oppindex == 78):
				#currentsuit = "none this is the deckback"
				#print("currentsuit is ------> " + currentsuit)
				print("deckback")
			
#			if(opponentsamesuit == true || opponentsamerank == true):
#				print(String(oppindex) + "-oppindex-" + ophand)
#				get_node("Sprite2").texture = actual[oppindex]
#				get_node("Label3").text = scards[cardcount]
#				get_node("Label4").text = String(cardcount)
#				discardpile.append(ophand)			
#				opponenthand.remove(oppindex)
#				break
			#maybe play card at end of function
			
			oppygone = oppygone + 1
			if(opponentsamesuit || opponentsamerank):
				break
		for o in opponenthand:
			print("new opponent hand is " + o)
			player = next_turn()				
				
		
		
		
#		showcard = scards[cardcount].substr(0,2).to_int()
#		###print(String(showcard) + " " + scards[cardcount])
#		get_node("Sprite").texture = actual[showcard]
#		get_node("Label").text = scards[cardcount]
#		get_node("Label2").text = String(cardcount)
		
#		cardn.append(TextureRect.new())
#		#if cycle == 1:
#		#	cardcount = cardcount + 78
#		#if(cardn != null):
#		if (cardn[cardcounttotal] != null):
#			cardn[cardcounttotal].set_script(cardscript)
#		###################################################################################################
#		var lighter = Light2D.new()
#		lighter.hide()
#		lighter.set_name("lighter")
#		lighter.texture = lightpic
#		lighter.position.x = 40
#		lighter.position.y = 70
#		lighter.scale = s
#		#cardc.append(Control.new())
#		cardn[cardcounttotal].set_name("card" + String(cardcounttotal))#######################################################maybeuse cardcountcycle here
#		
#		#scards discard resued logic is needed
#		cardn[cardcounttotal].cardname = scards[cardcount]########?????????????????????????????????????not sure about cardcount
#		#cardc[cardcount].set_name("cardc" + String(cardcount))
#		#cardn[cardcount].texture = actual[showcard] #
#		cardn[cardcounttotal].texture = get_resized_texture(actual[showcard],80,140)
#		
#
#		cardn[cardcounttotal].connect("mouse_entered", cardn[cardcounttotal], "entered_mouse") 
#		cardn[cardcounttotal].connect("mouse_exited", cardn[cardcounttotal] ,"exited_mouse")


#		if handcount < 20:
#			if(get_node("HBoxContainer") != null):
#				get_node("HBoxContainer").add_child(cardn[cardcounttotal])
#			if(get_node("HBoxContainer/card" + String(cardcounttotal)) != null):
#				get_node("HBoxContainer/card" + String(cardcounttotal)).add_child(lighter)
#			notinhandcount2 = true
#			handcount = handcount + 1
#			#get_node("HBoxContainer/card" + String(cardcount)).connect("mouse_entered", self, get_node("HBoxContainer/card" + String(cardcount)).entered_mouse())
#		elif handcount >= 20 && handcount2 < 20: # && cycle == 0:
#			if(get_node("HBoxContainer2") != null):
#				get_node("HBoxContainer2").add_child(cardn[cardcounttotal])
#			if(get_node("HBoxContainer2/card" + String(cardcounttotal)) != null):
#				get_node("HBoxContainer2/card" + String(cardcounttotal)).add_child(lighter)
#				notinhandcount2 = false
#			handcount2 = handcount2 + 1


#		cardcount = cardcount + 1
#		cardcounttotal = cardcounttotal + 1



#		if (oppindex > 21 && oppindex <= 35 && lastsuit == "wands" && opponentsamerank == true):
#			#randomly select either
#			#play the card
#			pass
#		if (oppindex > 35 && oppindex <= 49 && lastsuit == "pentacles" && opponentsamerank == true):
#			#play the card
#			pass
#		if (oppindex > 49 && oppindex <= 63 && lastsuit == "cups" && opponentsamerank == true):
#				#play the card
#			pass
#		if (oppindex > 63 && oppindex <= 77 && lastsuit =="swords" && opponentsamerank == true):	
#			#play the card
#			pass
				
#		if ophand.substr(3,4):
#			#pass
#			var oppy = ophand.substr(3,4)
#			print("THE SUBSTRING FOR OPPONENTS HAND IS---" + oppy)
#			if lastcardname.substr
			#pass

#		if(lastcard):
#
#	if(currentCardPlayed):
#		if(lastcard):
#			if (currentCardPlayed <= 21 && lastcard <= 21):
#				#TrumpRank() depricated using a function for one if statement seems too much
#				#do trump rank here
#				if (currentCardPlayed > lastcard):
#					pickSuit()
#					currentsuit = "trumps - ranking just occured - current card greater than last card"
#					print(currentsuit)
#			if(currentCardPlayed > 21 && lastcard > 21):
#				if (currentcardplayedname.substr(3,4) == lastcardname.substr(3,4)):
#					samerank = true
#					print("This is the current and last card rank match" + currentcardplayedname + " ------last-card-name------>>>" + lastcardname)
#					print(currentcardplayedname.substr(3,4) + " ------  " + lastcardname.substr(3,4))
#		else:
#			if (currentCardPlayed <= 21):
#				pickSuit()
	#pass
	
#func remove_card(opponent, card):
	
func remove_card(opponent, card):
	if card in opponent:
		opponent.remove(card)
		opponenthanddiscard.append(card)
	else:
		if card in opponenthanddiscard:
			print("Opponent has already removed this card.")
		else:
			print("Card not found in opponent's hand or removed cards.")
			
#func remove_card(opponent, card):
#	if card in opponent.hand:
#		opponent.hand.remove(card)
#		opponent.removed_cards.append(card)
#	else:
#		if card in opponent.removed_cards:
#			print("Opponent has already removed this card.")
#		else:
#			print("Card not found in opponent's hand or removed cards.")
#
#func remove_card(opponent, card):
#	for card in opponent:
#		if card not in opponenthanddiscard:
#			opponent.remove(card)
#			opponenthandiscard.append(card)
#		else:
#			print("Opponent has already removed this card.")
#
##
##func remove_card(opponent, card):
##	if card not in opponent.removed_cards:
##		opponent.hand.remove(card)
##		opponent.removed_cards.append(card)
##	else:
##		print("Opponent has already removed this card.")
		
		
			
func pickSuit():
	print("Suit will be picked.")
	pass
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
			
			
func get_resized_texture(t: Texture, width: int = 0, height: int = 0):
		var image = t.get_data()
		if width > 0 && height > 0:
			image.resize(width, height)
		var itex = ImageTexture.new()
		itex.create_from_image(image)
		return itex

func entered_mouse():
	self.get_node("lighter").show()  
	
func exited_mouse():
	self.get_node("lighter").hide()
	#get_node("HBoxContainer/card" + String(cardcount-1) + "/lighter").hide()



func _on_HBoxContainer_mouse_entered():
	firstrow = true
#	pass # Replace with function body.


func _on_HBoxContainer_mouse_exited():
	firstrow = false
#	pass # Replace with function body.


func _on_HBoxContainer2_mouse_entered():
	secondrow = true
#	pass # Replace with function body.


func _on_HBoxContainer2_mouse_exited():
	secondrow = false
#	pass # Replace with function body.


func _on_Timer_timeout():
	opponentPlayCard()
	#pass # Replace with function body.


















#
#
#
#func opponentPlayCard():
#		var oppygone = 0
#		print("the opphand   ")
#
#		for o in opponenthand:
#			print("opponent hand is " + o)
#
#		print("*******************************************look here for index, opponenthand[index]********************************")	
#		for index in range(len(opponenthand)):
#			print(index, opponenthand[index])
#
#		for ophand in opponenthand:
#			#checksuit
#			oppindex = ophand.substr(0,2).to_int()
#				#checkrank
#			if(oppindex > 21 && oppindex < 78):
#				if (ophand.substr(3,4) == lastcardname.substr(3,4)):
#					print("opponent play card for rank" + String(oppindex) + "  -- for card" + lastcardname + " and " + ophand)
#					opponentsamerank = true
#					get_node("Sprite2").texture = actual[oppindex]
#					get_node("Label3").text = ophand#lastcardname#playedcardname#scards[cardcount]
#					get_node("Label4").text = String(cardcount)
#					discardpile.append(ophand)		
#					#remove_card(opponenthand, oppygone)	
#					#opponenthand.remove(ophand)
#					print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
#					for index in range(len(opponenthand)):
#						print(index, opponenthand[index])
#						if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
#							opponenthand.remove(index - 1)#opponenthand[index]
#					#break
#					#play card of same rank
#					#pass
#
#			if oppindex <= 21:
#				#play the card
#				print("I should play my TRUMP card!!!")
#				get_node("Sprite2").texture = actual[oppindex]
#				get_node("Label3").text = ophand#playedcardname#scards[cardcount]
#				get_node("Label4").text = String(cardcount)
#				discardpile.append(ophand)	
#
#				print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
#				for index in range(len(opponenthand)):
#					print(index, opponenthand[index])
#					if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
#						opponenthand.remove(index - 1)#opponenthand[index]
#
##				break
#			if (oppindex > 21 && oppindex <= 35 && lastsuit == "wands"):
#				print("opponent play card for wands" + String(oppindex))
#				opponentsamesuit = true
#				#play the card
#				get_node("Sprite2").texture = actual[oppindex]
#				get_node("Label3").text = ophand#playedcardname# scards[cardcount]
#				get_node("Label4").text = String(cardcount)
#				discardpile.append(ophand)			
#				#remove_card(opponenthand, oppygone)
##				opponenthand.remove(ophand)
#				print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
#				for index in range(len(opponenthand)):
#					print(index, opponenthand[index])
#					if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
#						opponenthand.remove(index - 1)#opponenthand[index]
#				break
#				#pass
#			if(oppindex > 35 && oppindex <= 49 && lastsuit == "pentacles"):
#				print("opponent play card for pentacles" + String(oppindex))
#				opponentsamesuit = true
#				get_node("Sprite2").texture = actual[oppindex]
#				get_node("Label3").text = ophand#playedcardname# scards[cardcount]
#				get_node("Label4").text = String(cardcount)
#				discardpile.append(ophand)			
#				print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
#				for index in range(len(opponenthand)):
#					print(index, opponenthand[index])
#					if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
#						opponenthand.remove(index - 1)#opponenthand[index]
#
#				break
#				#play the card
#				#pass
#
#			if (oppindex > 49 && oppindex <= 63 && lastsuit == "cups"):
#				print("opponent play card for cups" + String(oppindex))
#				opponentsamesuit = true	
#				get_node("Sprite2").texture = actual[oppindex]
#				get_node("Label3").text = ophand#playedcardname# scards[cardcount]
#				get_node("Label4").text = String(cardcount)
#				discardpile.append(ophand)
#				print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
#				for index in range(len(opponenthand)):
#					print(index, opponenthand[index])
#					if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
#						opponenthand.remove(index - 1)#opponenthand[index]
#
#				break
#				#play the card
#				#pass
#			if (oppindex > 63 && oppindex <= 77 && lastsuit =="swords"):	
#				print("opponent play card for swords" + String(oppindex))
#				opponentsamesuit = true
#				get_node("Sprite2").texture = actual[oppindex]
#				get_node("Label3").text = ophand#playedcardname# scards[cardcount]
#				get_node("Label4").text = String(cardcount)
#				discardpile.append(ophand)			
#
#				print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
#				for index in range(len(opponenthand)):
#					print(index, opponenthand[index])
#					if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
#						opponenthand.remove(index - 1)#opponenthand[index]
#				break
#
#			if(oppindex == 78):
#				#currentsuit = "none this is the deckback"
#				print("deckback")
#
#			player = next_turn()
#			oppygone = oppygone + 1
#			if(opponentsamesuit || opponentsamerank):
#				break
#
#


#
#
#func Opponent():
##forreference add in later				discardpile.append(get_node("HBoxContainer/" + selectedcard).cardname)
#	print("opponent:")
#	showcard = scards[cardcount].substr(0,2).to_int()
#	print(String(showcard) + " - " + scards[cardcount])
#	#lastcardname = scards[lastcard]#removinglasCardPlayed for showcard
#
#	if (lastcard != null):
#		get_node("Sprite3").texture = actual[lastcard]#showcard]
#	####discardpile.append(lastcard)##########################################maybe this needs uncommented not sure
##	get_node("Label3").text = lastcardname# scards[cardcount]#######################################################################################################
#	get_node("Label3").text = ("blah" + playedcardname)#scards[lastCardPlayed]# scards[cardcount]#######################################################################################################
#	get_node("Label4").text = String(cardcount)
#
#	#get card for opponent
#	showcard = scards[cardcount].substr(0,2).to_int()
#	print(String(showcard) + " " + scards[cardcount])
#	##########get_node("Sprite").texture = actual[showcard]
#	get_node("Label").text = scards[cardcount]
#	get_node("Label2").text = String(cardcount)
#	#cardcount  = cardcount + 1
#	#countme = false
#	#pass
#	showcard = scards[cardcount].substr(0,2).to_int()
#	###print(String(showcard) + " " + scards[cardcount])
#	get_node("Sprite4").texture = actual[showcard]
#	get_node("Label5").text = scards[cardcount]
#	get_node("Label6").text = String(cardcounttotal)
#	var opponentmsg = "Your Oppenent Took a Card -" + scards[cardcount]
#	get_node("Label7").text = opponentmsg
#
#
#	#######################this section seems off commenting out
##	cardn.append(TextureRect.new())
##	#if cycle == 1:
##	#	cardcount = cardcount + 78
##	cardn[cardcount].set_script(cardscript)
##	var lighter = Light2D.new()
##	lighter.hide()
##	lighter.set_name("lighter")
##	lighter.texture = lightpic
##	lighter.position.x = 40
##	lighter.position.y = 70
##	lighter.scale = s
##	#cardc.append(Control.new())
##	cardn[cardcount].set_name("card" + String(cardcount))
##	cardn[cardcount].cardname = scards[cardcount]
##	#cardc[cardcount].set_name("cardc" + String(cardcount))
##	#cardn[cardcount].texture = actual[showcard] #
##	cardn[cardcount].texture = get_resized_texture(actual[showcard],80,140)
##	#if(Opcc == true):
##
##	cardcount = cardcount + 1
#	#Opcc = false
#		#countme = false
##	lastcardname = scards[cardcount]
#
##&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#
##add to player hand somehow
#	#showcard = cards[cardcount].substr(0,2).to_int()
#	###print(String(showcard) + " " + scards[cardcount])
#	get_node("Sprite4").texture = actual[showcard]
#	#get_node("Label3").text = get_node("Label5").text    # = scards[cardcount]
#	#get_node("Label3").text = scards[cardcount]###????
#	#get_node("Label2").text = String(cardcount)
#
#	cardn.append(TextureRect.new())
#	#if cycle == 1:
#	#	cardcount = cardcount + 78
#	#if(cardn != null):
#	if (cardn[cardcounttotal] != null):
#		cardn[cardcounttotal].set_script(cardscript)
#	###################################################################################################
#	var lighter = Light2D.new()
#	lighter.hide()
#	lighter.set_name("lighter")
#	lighter.texture = lightpic
#	lighter.position.x = 40
#	lighter.position.y = 70
#	lighter.scale = s
#	#cardc.append(Control.new())
#	cardn[cardcounttotal].set_name("card" + String(cardcounttotal))#######################################################maybeuse cardcountcycle here
#
#		#scards discard resued logic is needed
#	cardn[cardcounttotal].cardname = scards[cardcount]
#	#cardc[cardcount].set_name("cardc" + String(cardcount))
#	#cardn[cardcount].texture = actual[showcard] #
#	cardn[cardcounttotal].texture = get_resized_texture(actual[showcard],80,140)
#
#
#
#	cardn[cardcounttotal].connect("mouse_entered", cardn[cardcounttotal], "entered_mouse") 
#	cardn[cardcounttotal].connect("mouse_exited", cardn[cardcounttotal] ,"exited_mouse")
#
##	if handcount < 20:
##		if(get_node("HBoxContainer") != null):
##			get_node("HBoxContainer").add_child(cardn[cardcounttotal])
##		if(get_node("HBoxContainer/card" + String(cardcounttotal)) != null):
##			get_node("HBoxContainer/card" + String(cardcounttotal)).add_child(lighter)
##		handcount = handcount + 1
#		#get_node("HBoxContainer/card" + String(cardcount)).connect("mouse_entered", self, get_node("HBoxContainer/card" + String(cardcount)).entered_mouse())
##	elif handcount >= 20 && handcount2 < 20: # && cycle == 0:
##		if(get_node("HBoxContainer2") != null):
###			get_node("HBoxContainer2").add_child(cardn[cardcounttotal])
##		if(get_node("HBoxContainer2/card" + String(cardcounttotal)) != null):
##			get_node("HBoxContainer2/card" + String(cardcounttotal)).add_child(lighter)
##		handcount2 = handcount2 + 1
#	opponenthand.append(scards[cardcount])
#	######################################################################look at this section for logic
#	##ifplayablecard then add to discard pile#
#	#discardpile.append(scards[cardcount])####
#	##########################################
#	print("----------------------opponent-hand----------------------")
#	print(opponenthand)
#	print("----------------------opponent-hand-end------------------")
#	cardcount = cardcount + 1
#	cardcounttotal = cardcounttotal + 1
#	get_node("Timer").start()
#	#opponentPlayCard()
