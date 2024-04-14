class DataEngine(object):

    def __init__(data_file_path: str):
        self.filepath = data_file_path

    def insert(json_data: str) -> bool:
        with open(self.filepath, "w") as f:
            f.write(json.dumps(result, separators=(',', ':')))

        return True

    def select(object_id) -> str:
        return "{\"dummy\" : \"dummy\"}"

    def update(oject_id, json_data: str) -> bool:
        return True

