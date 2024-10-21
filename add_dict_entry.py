import os
import re
from pathlib import Path

def insert_new_entry():
    print("Adding new entry to dictionary\n\n")
    v1 = input("new word --> ")
    v2 = input("1=noun, 2=verb, 3=adverb, 4=adjective --> ")

    t = ""
    if v2 == "1":
        t = "noun"
    elif v2 == "2":
        t = "verb"
    elif v2 == "3":
        t = "adverb"
    elif v2 == "4":
        t = "adjective"
    else:
        print("Unknown type. Bye.")
        input("Press 'Enter' to close.")
        return

    v3 = input("translation --> ")


    file_name = v1[0].upper() + ".tex"

    try:
        script_dir = Path(__file__).parent.resolve()
    except NameError:
        script_dir = Path(os.getcwd())

    new_entry =  "\\entry{" + v1 + "}{" + t + "}{" + v3 + "}"
    full_path =  script_dir.absolute().as_posix() + "/" + file_name

    pattern = r"\{([^}]*)\}"
    all_into_list = []
    with open(full_path, 'r', encoding='utf-8') as file:
        for line in file:
            matches = re.findall(pattern, line)

            if matches and len(matches) > 1:
                all_into_list.append(line.strip())
                if matches[0] == v1 and matches[1] == t:
                    print("\n" + t + " '" + v1 + "' already exists in the dictionary")
                    input("Press 'Enter' to close.")
                    return
        all_into_list.append(new_entry)
        sorted_list = sorted(all_into_list, key=str.casefold)

    answer = input( "\nAdd new entry to dictionary? 'y/n'" )
    if answer.lower() == "y" or answer.lower() == "":
        with open(full_path, 'w', encoding='utf-8') as file:
            file.write("\n".join(str(n) for n in sorted_list) + "\n")

def main():
    insert_new_entry()

if __name__ == "__main__":
    main()
