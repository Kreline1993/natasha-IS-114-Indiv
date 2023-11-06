use context essentials2021
#INCLUDERE KODEEKSAPMPLER
include shared-gdrive(
"dcic-2021",
"1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")
include gdrive-sheets
include data-source
ssid = "1RYN0i4Zx_UETVuYacgaGfnFcv4l9zd9toQTTdkQkj7g"

#Bruk tabell
kWh-wealthy-consumer-data = load-table: komponent, energi
source: load-spreadsheet(ssid).sheet-by-name("kWh", true)
    # oppgave a)
    sanitize energi using string-sanitizer
end
kWh-wealthy-consumer-data

#Bil bruk
fun bil-energi-bruk(distanse-per-dag :: Number, distanse-per-drivstoff :: Number) -> Number:
  energi-per-drivstoff = 10
  (distanse-per-dag / distanse-per-drivstoff) * energi-per-drivstoff
end

#
fun energi-to-number(str :: String) -> Number:
# skriv koden her (tips: bruk cases og string-to-number funksjonen)
  cases(Option) string-to-number(str):
    | some(a) => a
      # | none => 0
      # oppgave b)
     
    | none => bil-energi-bruk(30, 10)
  end
where:
  #feil etter endringer
  #energi-to-number("") is 0
  
  #modifisert where block
  energi-to-number("") is bil-energi-bruk(30, 10)
energi-to-number("48") is 48
end

# oppgave c)
transformed-til-tall-data = transform-column(kWh-wealthy-consumer-data, "energi", energi-to-number)
transformed-til-tall-data

#oppgave d)
energiforbruket = sum(transformed-til-tall-data, "energi")
energiforbruket

#oppgave e)
bar-chart(transformed-til-tall-data, "komponent", "energi")
