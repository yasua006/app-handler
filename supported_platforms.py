from json import JSONDecodeError as jsonde
from warnings import warn

from modules.python.convert import info_json_to_dict
from modules.python.check_empty_list import is_empty_list
from modules.python.pretty_list import get_pretty_list

supported_key: str = "Supported"

supported_platforms: list[str] = []


def add_sp_platforms_to_dict() -> None:
    try:
        info_dict: dict[str, dict[str, bool] | dict[str, str]] = info_json_to_dict()
        handle_sp_platforms(info_dict, supported_platforms)

        if is_empty_list(supported_platforms):
            warn("Supported platforms are empty!")
            return
        
    except FileNotFoundError:
        warn("File not found! Was source file renamed?")
        return
    except jsonde:
        warn("Error on JSON decode! Decoded wrong file?")
        return

def handle_sp_platforms(info_dict: dict[str, dict[str, bool] | dict[str, str]], supported_platforms: list[str]) -> None:
    for platform, supported in info_dict[supported_key].items():
        if supported:
            supported_platforms.append(platform)

if __name__ == "__main__":
    add_sp_platforms_to_dict()
    print(f"Supported platforms: {get_pretty_list(supported_platforms)}")