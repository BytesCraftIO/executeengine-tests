import pytest
import os
from uuid import uuid4


@pytest.fixture
def download_repo():
    download_location: str = "/tmp/{}".format(uuid4())
    def _download_repo(repo_url: str) -> str:
        # Download the repo to the download location
        return download_location
    
    yield _download_repo
    # remove the downloaded location
    os.system("rm -rf {}".format(download_location))


@pytest.parametrize("repo_url", [
    "repo_url1",
])
def test_execute_engine_java(repo_url, download_repo):
    repo_path = download_repo(repo_url)
    output_path = "{}/output.json".format(repo_path)

    # execute the parse command
    # assertion for the json

    # execute execution command
    # assertion for the logs
    pass
