import requests
import json

metadata_url = 'http://169.254.169.254/latest/' # initial url to get metadata of the instance

def get_values_recursively(url, arr): # recursively retrieve all the attributes of the metadata
    output = {}
    for item in arr:
        new_url = url + item
        response = requests.get(new_url)
        text = response.text
        if item[-1] == "/":
            list_of_values = response.text.splitlines()
            output[item[:-1]] = get_values_recursively(new_url, list_of_values)
        elif is_json(text):
            output[item] = json.loads(text)
        else:
            output[item] = text
    return output


def get_metadata(): # start retrieving the metadata
    initial = ["meta-data/"]
    result = get_values_recursively(metadata_url, initial)
    return result


def is_json(myjson): # check if the json value is valid
    try:
        json.loads(myjson)
    except ValueError:
        return False
    return True

if __name__ == '__main__':
    data = get_metadata()
    print(json.dumps(data)) # print the metadata
    with open("metadata.json", "w+") as file: # write the metadata to JSON
        json.dump(data, file)
