# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Source.delete_all
SourceItaly.delete_all
SourceFrance.delete_all
Stock.delete_all

Cac40Report.delete_all
Dax30Report.delete_all
FiasReport.delete_all

User.delete_all
UserReport.delete_all

Market.delete_all

#Other tables
Analysis.delete_all
#follow_stock_newsletters
#followers
#friendly_id_slugs
#market_suggestions_newsletters

###Source###
source_list = [
  ["IT0001233417", "A2a", "https://www.borsaitaliana.it/borsa/azioni/scheda/IT0001233417.html?lang=it", "https://www.borsaitaliana.it/companyprofile/htm/it/9.htm", "https://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!A2A.MI", "https://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0001233417&lang=it", "https://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0001233417&Lettera=A&QUOTE=%21A2A.MI&refresh_ce=", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=00c0&codicestrumento=w2ae&DBCOD=A2A", "https://www.teleborsa.it/azioni/a2a-a2a-it0001233417-SVQwMDAxMjMzNDE3/analisi", "", "", "", "", "", "", ""],
  ["IT0001178299", "Reno De Medici", "https://www.borsaitaliana.it/borsa/azioni/scheda/IT0001178299.html?lang=it", "https://www.borsaitaliana.it/companyprofile/htm/it/217.htm", "https://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!RM.MI", "https://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0001178299&lang=it", "https://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0001178299&Lettera=R&QUOTE=%21RM.MI&refresh_ce=", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=00a8&codicestrumento=w2ae&DBCOD=RM", "https://www.teleborsa.it/azioni/reno-de-medici-rm-it0001178299-SVQwMDAxMTc4Mjk5/analisi", "", "", "", "", "", "", ""],
  ["IT0000066123", "Bper Banca", "https://www.borsaitaliana.it/borsa/azioni/scheda/IT0000066123.html?lang=it", "https://www.borsaitaliana.it/companyprofile/htm/it/43.htm", "https://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!BPE.MI", "https://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0000066123&lang=it", "https://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0000066123&Lettera=B&QUOTE=%21BPE.MI&refresh_ce=", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=006e&codicestrumento=w2ae&DBCOD=BPE", "https://www.teleborsa.it/azioni/bper-bpe-it0000066123-SVQwMDAwMDY2MTIz/analisi", "", "", "", "", "", "", ""],
  ["IT0003023980", "Centrale Del Latte D&apos;Italia", "https://www.borsaitaliana.it/borsa/azioni/scheda/IT0003023980.html?lang=it", "https://www.borsaitaliana.it/companyprofile/htm/it/474.htm", "https://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!CLI.MI", "https://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0003023980&lang=it", "https://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0003023980&Lettera=C&QUOTE=%21CLI.MI&refresh_ce=", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=01ac&codicestrumento=w2ae&DBCOD=CLI", "https://www.teleborsa.it/azioni/centrale-del-latte-d-italia-cli-it0003023980-SVQwMDAzMDIzOTgw/analisi", "", "", "", "", "", "", ""],

  ["FR0000120321", "L&apos;Oreal", "", "", "", "", "", "", "", "https://www.tradingsat.com/loreal-FR0000120321/societe.html", "https://www.tradingsat.com/loreal-FR0000120321/", "https://bourse.fortuneo.fr/api/value/trends/ACTIONS/FTN000023FR0000120321", "https://bourse.fortuneo.fr/api/value/performance-periods/ACTIONS/FTN000023FR0000120321", "http://bourse.lefigaro.fr/indices-actions/cours-l-oreal-or-fr0000120321-par", "http://tradingradar.net/fr", "https://bourse.fortuneo.fr/api/value/avis/FTN000023FR0000120321"],
  ["FR0000120073", "Air Liquide", "", "", "", "", "", "", "", "https://www.tradingsat.com/air-liquide-FR0000120073/societe.html", "https://www.tradingsat.com/air-liquide-FR0000120073/", "https://bourse.fortuneo.fr/api/value/trends/ACTIONS/FTN000023FR0000120073", "https://bourse.fortuneo.fr/api/value/performance-periods/ACTIONS/FTN000023FR0000120073", "http://bourse.lefigaro.fr/indices-actions/cours-air-liquide-ai-fr0000120073-par", "http://tradingradar.net/fr", "https://bourse.fortuneo.fr/api/value/avis/FTN000023FR0000120073"],
]

source_list.each do |isin, name, url_0, url_1, url_2, url_3, url_4, url_5, url_6, url_7, url_8, url_9, url_10, url_11, url_12, url_13|
  #Source.create(isin: isin, name: name, url_0: url_0, url_1: url_1, url_2: url_2, url_3: url_3, url_4: url_4, url_5: url_5, url_6: url_6, url_7: url_7, url_8: url_8, url_9: url_9, url_10: url_10, url_11: url_11, url_12: url_12, url_13: url_13)
end
###Source###

###Source Italy###
sourceitaly_list = [
  ["IT0001233417", "A2a", "https://www.borsaitaliana.it/borsa/azioni/scheda/IT0001233417.html?lang=it", "https://www.borsaitaliana.it/companyprofile/htm/it/9.htm", "https://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!A2A.MI", "https://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0001233417&lang=it", "https://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0001233417&Lettera=A&QUOTE=%21A2A.MI&refresh_ce=", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=00c0&codicestrumento=w2ae&DBCOD=A2A", "https://www.teleborsa.it/azioni/a2a-a2a-it0001233417-SVQwMDAxMjMzNDE3/analisi"],
  ["IT0001178299", "Reno De Medici", "https://www.borsaitaliana.it/borsa/azioni/scheda/IT0001178299.html?lang=it", "https://www.borsaitaliana.it/companyprofile/htm/it/217.htm", "https://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!RM.MI", "https://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0001178299&lang=it", "https://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0001178299&Lettera=R&QUOTE=%21RM.MI&refresh_ce=", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=00a8&codicestrumento=w2ae&DBCOD=RM", "https://www.teleborsa.it/azioni/reno-de-medici-rm-it0001178299-SVQwMDAxMTc4Mjk5/analisi"],
  ["IT0000066123", "Bper Banca", "https://www.borsaitaliana.it/borsa/azioni/scheda/IT0000066123.html?lang=it", "https://www.borsaitaliana.it/companyprofile/htm/it/43.htm", "https://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!BPE.MI", "https://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0000066123&lang=it", "https://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0000066123&Lettera=B&QUOTE=%21BPE.MI&refresh_ce=", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=006e&codicestrumento=w2ae&DBCOD=BPE", "https://www.teleborsa.it/azioni/bper-bpe-it0000066123-SVQwMDAwMDY2MTIz/analisi"],
  ["IT0003023980", "Centrale Del Latte D&apos;Italia", "https://www.borsaitaliana.it/borsa/azioni/scheda/IT0003023980.html?lang=it", "https://www.borsaitaliana.it/companyprofile/htm/it/474.htm", "https://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!CLI.MI", "https://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0003023980&lang=it", "https://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0003023980&Lettera=C&QUOTE=%21CLI.MI&refresh_ce=", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=01ac&codicestrumento=w2ae&DBCOD=CLI", "https://www.teleborsa.it/azioni/centrale-del-latte-d-italia-cli-it0003023980-SVQwMDAzMDIzOTgw/analisi"],
]

sourceitaly_list.each do |isin, name, url_0, url_1, url_2, url_3, url_4, url_5, url_6|
  #SourceItaly.create(isin: isin, name: name, url_0: url_0, url_1: url_1, url_2: url_2, url_3: url_3, url_4: url_4, url_5: url_5, url_6: url_6)
end
###Source Italy###

###Source France###
sourcefrance_list = [
  ["FR0000120321", "L&apos;Oreal", "https://www.tradingsat.com/loreal-FR0000120321/societe.html", "https://www.tradingsat.com/loreal-FR0000120321/", "https://bourse.fortuneo.fr/api/value/trends/ACTIONS/FTN000023FR0000120321", "https://bourse.fortuneo.fr/api/value/performance-periods/ACTIONS/FTN000023FR0000120321", "http://bourse.lefigaro.fr/indices-actions/cours-l-oreal-or-fr0000120321-par", "http://tradingradar.net/fr", "https://bourse.fortuneo.fr/api/value/avis/FTN000023FR0000120321"],
  ["FR0000120073", "Air Liquide", "https://www.tradingsat.com/air-liquide-FR0000120073/societe.html", "https://www.tradingsat.com/air-liquide-FR0000120073/", "https://bourse.fortuneo.fr/api/value/trends/ACTIONS/FTN000023FR0000120073", "https://bourse.fortuneo.fr/api/value/performance-periods/ACTIONS/FTN000023FR0000120073", "http://bourse.lefigaro.fr/indices-actions/cours-air-liquide-ai-fr0000120073-par", "http://tradingradar.net/fr", "https://bourse.fortuneo.fr/api/value/avis/FTN000023FR0000120073"],
]

sourcefrance_list.each do |isin, name, url_0, url_1, url_2, url_3, url_4, url_5, url_6|
  #SourceFrance.create(isin: isin, name: name, url_0: url_0, url_1: url_1, url_2: url_2, url_3: url_3, url_4: url_4, url_5: url_5, url_6: url_6)
end
###Source France###

###Stock###
stock_list = [
  ["IT0001233417", "A2A.MI"],
  ["FR0000120172", "CARR.PA"],
  ["DE000A1EWWW0", "ADSGn.DE"],
  ["IT0001347308", "BZU.MI"],
]

stock_list.each do |isin, reuters|
  #Stock.create(isin: isin, reuters: reuters)
end
###Stock###

###Fias Report###
fias_report_list = [
  ["IT0001233417", "A2a", "4.56", "5.11"],
  ["IT0001347308", "Buzzi Unicem", "0.566", "0.788"],
]

fias_report_list.each do |isin, stock, borsaitaliana_support, borsaitaliana_resistance|
  #FiasReport.create(isin: isin, stock: stock, borsaitaliana_support: borsaitaliana_support, borsaitaliana_resistance: borsaitaliana_resistance)
end
###Fias Report###

###Cac40 Report###
cac40_report_list = [
  ["FR0000120172", "Carrefour", "Up", "Down", "Up"],
]

cac40_report_list.each do |isin, stock, tradingsat_trendshort, tradingsat_trendmedium, tradingsat_trendlong|
  #Cac40Report.create(isin: isin, stock: stock, tradingsat_trendshort: tradingsat_trendshort, tradingsat_trendmedium: tradingsat_trendmedium, tradingsat_trendlong: tradingsat_trendlong)
end
###Cac40 Report###

###Dax30 Report###
dax30_report_list = [
  ["DE000A1EWWW0", "Adidas", "3.5", "5"],
]

dax30_report_list.each do |isin, stock, finanzen_rating, finanzen_ratingmoodys|
  #Dax30Report.create(isin: isin, stock: stock, finanzen_rating: finanzen_rating, finanzen_ratingmoodys: finanzen_ratingmoodys)
end
###Dax30 Report###

###Market###
#Markets are ordered by id in the top section
market_list = [
  ["FTSE MIB", "", "", "italy", "https://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=SPMib", '/descendant::div[@id="_DETTOP_"]//div[@class="databox"][2]//td[contains(@class, "data")]/text()', '/descendant::div[@id="_DETTOP_"]//div[@class="databox"][1]//td[contains(@class, "data")]//text()', "italy_ftsemib"],
  ["CAC 40", "", "", "france", "https://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!PCAC.PAR", '/descendant::div[@id="_DETTOP_"]//div[@class="databox"][2]//td[contains(@class, "data")]/text()', '/descendant::div[@id="_DETTOP_"]//div[@class="databox"][1]//td[contains(@class, "data")]//text()', "france_cac40"],
]

market_list.each do |name, value, variation, country, source, path, path2, target|
  #Market.create(name: name, value: value, variation: variation, country: country, source: source, path: path, path2: path2, target: target)
end
###Market###

###User###
user_list = [
  ["Marco", "Pavan", "marcopavan@email.it"],
]

user_list.each do |name, surname, email|
  #User.create(name: name, surname: surname, email: email)
end
###User###
