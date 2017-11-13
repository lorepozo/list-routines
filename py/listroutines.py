"""
listroutines provides a python interface for using
an interactive dataset for program learning.

See https://lucasem.github.io/list-routines for more information.

INPUT: number, list of numbers, or list of list of numbers
OUTPUT: bool, number, or list of numbers
"""

import requests

api = "http://localhost:8000"
max_count = 100


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

    Access the routine id with the .id member.
    """

    def __init__(self, id):
        """
        Creates a routine with the associated id.

        :param id: string of routine id
        """
        self.id = id

    def dependencies(self):
        """
        The routines that this routine is directly conceptually dependent on.

        :returns: list of Routine
        """
        return [Routine(id) for id in
                _api_result(requests.get(f"{api}/find?count={max_count}&depended_on_by={self.id}"))]

    def depends(self):
        """
        The routines that directly conceptually depend on this routine.

        :returns: list of Routine
        """
        return [Routine(id) for id in
                _api_result(requests.get(f"{api}/find?count={max_count}&depends_on={self.id}"))]

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


def find(**kwargs):
    """
    Gets a list of routines from the dataset. Parameters can be "count" taking
    a nonnegative number, or "depends_on"/"depended_on_by" taking a routine id.

    :param kwargs: find parameters
    :returns: list of Routine
    :raises APIError: if some API error occurred
    """
    return [Routine(id) for id in
            _api_result(requests.get(f"{api}/find", params=kwargs))]
