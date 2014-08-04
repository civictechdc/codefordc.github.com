import csv
import json

csvfile = open('../data/projects.csv', 'r')
jsonfile = open('../civic.json', 'w')

reader = csv.DictReader(csvfile)
#out = json.dumps( [row for row in csvreader] )
jsontemp = []

print reader.fieldnames
for each in reader:
	row = {}
	row['status'] = 'Alpha'  #not subtle
	row['thumnailUrl'] = ''
	row['bornAt'] = 'Code for DC'
	row['geography'] = 'Washington, DC'
	row['political entity'] = ''
	row['type'] = ''
	row['needs'] = []
	row['needs'].append(each['Need/want? *public*'])
	row['categories'] = []
	#row['categories'].append(each['Need/want? *public*'])

	#now create Code for DC specific keys
	row['c4dc'] = {}
	
	row['c4dc']['name'] = each['Name']
	row['c4dc']['description'] = each['Description *public*']
	row['c4dc']['contact name'] = each['Project Contact Name *public*']
	row['c4dc']['contact twitter'] = each['Project Contact Twitter *public*']
	row['c4dc']['contact email'] = each['Project Contact Email']
	row['c4dc']['has data?'] = each['Has data']
	row['c4dc']['more info link'] = each['Link to more details']
	row['c4dc']['github link'] = each['Github repository']
	row['c4dc']['website link'] = each['Project Website']
	row['c4dc']['gov partner'] = each['Gov Partner']
	row['c4dc']['community partner'] = each['Community Partner']
	row['c4dc']['notes'] = each['Notes']
	row['c4dc']['data link'] = each['Link to data']
	row['c4dc']['display?'] = each['Display']
	row['c4dc']['health'] = each['Status']

	jsontemp.append(row)


json.dump(jsontemp, jsonfile, indent=4, sort_keys =False)
print jsontemp
