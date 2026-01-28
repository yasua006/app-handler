from warnings import warn

from modules.python.check_empty_str import is_empty_str

privilege_file = open("privilege.txt", "r+")


# * brukt i shell (option 5)
def switch_privilege_lvl() -> None:
    privilege: str = privilege_file.read()

    if is_empty_str(privilege):
        warn("Privilege is empty!")
        privilege_file.close()
        return

    if privilege == "User":
        privilege_file.truncate(0)
        privilege_file.seek(0)
        privilege_file.write("System")
        privilege_file.flush()
    else:
        privilege_file.truncate(0)
        privilege_file.seek(0)
        privilege_file.write("User")
        privilege_file.flush()

    privilege_file.seek(0)
    privilege = privilege_file.read()
    print("Switched to privilege:", privilege)
    privilege_file.close()

if __name__ == "__main__":
    privilege: str = privilege_file.read()
    print("Current privilege:", privilege)
    privilege_file.close()