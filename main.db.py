from db import run_query_select, run_update_query

def israel_wins():
    israeli_wins = run_query_select("""SELECT COUNT(*) AS wins FROM eurovision_winners WHERE country = 'Israel'""")
    print("Israel wins:", israeli_wins[0]["wins"])

def full_details():
    full_table = run_query_select("""SELECT * FROM eurovision_winners e JOIN song_details s ON s.year = e.year""")
    for row in full_table:
        print(row)

def update_neta ():
    run_update_query("""UPDATE song_details SET song_length_seconds = 180 WHERE year = 2018 """)
    print("Netta's song length updated!")
    update = run_query_select("""SELECT * FROM song_details WHERE year = 2018""")
    print(update)

israel_wins()
full_details()
update_neta()