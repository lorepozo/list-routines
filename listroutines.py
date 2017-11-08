"""
listroutines provides a python interface for using
an interactive dataset for program learning.

See https://lucasem.github.io/list-routines for more information.

INPUT: number, list of numbers, or list of list of numbers
OUTPUT: bool, number, or list of numbers
"""

import requests

api = "http://localhost:8000"


def _api_result(req):
    r = req.json()
    if "error" in r:
        raise APIError(r["error"])
    return r["result"]


class APIError(BaseException):
    """
    Raised when a routine does not exist or some other unexpected error
    occurred.
    """
    def __init__(self, msg):
        self.msg = msg

    def msg(self):
        return self.msg


class Routine:
    """
    Provides an interface for a particular routine in the dataset.
    """
    def __init__(self, id):
        """
        Creates a routine with the associated id.

        :param id: string of routine id
        """
        self.id = id

    def id():
        """
        The id associated with the routine.

        :returns: string
        """
        return self.id

    def eval(self, inp):
        """
        Evaluates the routine with the given input.

        :param inp: INPUT
        :returns: OUTPUT
        :raises ValueError: if input was invalid
        :raises APIError: if some other API error occurred
        """
        out = _api_result(requests.post(f"{api}/eval/{self.id}", json=inp))
        if out is None:
            raise ValueError
        return out

    def examples(self):
        """
        Gets examples associated with the routine.

        :returns: list of INPUTs
        :raises APIError: if some other API error occurred
        """
        return _api_result(requests.get(f"{api}/examples/{self.id}"))

    def gen(self, **kwargs):
        """
        Generates suitable inputs for the routine. For information on params,
        see the routine description. The field "count" is always accepted, and
        specifies the number of inputs to generate.

        :param kwargs: generation parameters
        :returns: list of INPUTs
        :raises APIError: if some other API error occurred
        """
        return _api_result(requests.get(f"{api}/gen/{self.id}", params=kwargs))


def find(count=1):
    """
    Gets a list of routines from the dataset.

    :param count: number of routines to find
    :returns: list of routines in the dataset
    :raises APIError: if some API error occurred
    """
    return [Routine(id) for id in
            _api_result(requests.get(f"{api}/find?count={count}"))]
