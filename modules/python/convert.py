from json import load


def info_json_to_dict() -> dict[str, dict[str, bool] | dict[str, str]]:
    info_json = open("supported.json", "r")
    info_dict: dict[str, dict[str, bool] | dict[str, str]] = load(info_json)
    info_json.close()
    return info_dict

if __name__ == "__main__":
    info_json_to_dict()