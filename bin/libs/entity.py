from bin.libs.env import env
from bin.libs import fs

class DotFileEntity():
    def __init__(self, filepath, topicname):
        self.TOPIC_DIRECTORY_PATH = str(env('TOPIC'))
        self.fileBaseName = fs.basename(filepath)
        self.homeFileDirPath = fs.dirname(filepath)
        self.homeFilePath = fs.join(
            self.homeFileDirPath, self.fileBaseName)
        self.topicName = topicname
        self.topicDirPath = fs.join(self.TOPIC_DIRECTORY_PATH, self.topicName)
        self.topicFilePath = fs.join(self.topicDirPath, self.fileBaseName)
