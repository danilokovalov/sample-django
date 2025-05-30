import json

with open("tf_output.json") as f:
    data = json.load(f)

with open("inventory.ini", "w") as inv:
    inv.write("[app]\n")
    inv.write(f"{data['app1_ip']['value']}\n")
    inv.write(f"{data['app2_ip']['value']}\n\n")

    inv.write("[db]\n")
    inv.write(f"{data['db_ip']['value']}\n")
