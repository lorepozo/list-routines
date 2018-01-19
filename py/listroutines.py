"""
listroutines provides a python interface for using an interactive dataset for program learning.

See https://lucasem.github.io/list-routines for more information.

INPUT: number, list of numbers, or list of list of numbers
OUTPUT: bool, number, or list of numbers
"""

import requests

api = "https://lists.lucasem.com"
max_count = 100


def _api_result(req):
    r = req.json()
    if "error" in r:
        raise APIError(r["error"])
    return r["result"]


class APIError(BaseException):
    """
    Raised when a routine does not exist or another unexpected error occurred.
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
        Create (i.e. load) a routine with the associated id.

        :param id: string of routine id
        """
        self.id = id

    def dependencies(self):
        """
        Get routines that this routine is directly conceptually dependent on.

        :returns: list of Routine
        """
        url = "{api}/find?count={max_count}&depended_on_by={id}".format(
            api=api, id=self.id, max_count=max_count)
        return [Routine(id) for id in _api_result(requests.get(url))]

    def is_parametric(self):
        """
        Check whether this routine is parametric.

        :returns: bool
        """
        url = "{api}/is-parametric/{id}".format(api=api, id=self.id)
        return _api_result(requests.get(url))

    def depends(self):
        """
        Get routines that directly conceptually depend on this routine.

        :returns: list of Routine
        """
        url = "{api}/find?count={max_count}&depends_on={id}".format(
            api=api, id=self.id, max_count=max_count)
        return [Routine(id) for id in _api_result(requests.get(url))]

    def eval(self, inp, **kwargs):
        """
        Evaluate the routine with the given input.

        :param inp: INPUT
        :param kwars: routine parameters (for parametric routines)
        :returns: OUTPUT
        :raises ValueError: if input was invalid
        :raises APIError: if some other API error occurred
        """
        url = "{api}/eval/{id}".format(api=api, id=self.id)
        out = _api_result(requests.post(url, json=inp, params=kwargs))
        if out is None:
            raise ValueError
        return out

    def examples(self):
        """
        Get examples associated with the nonparametric routine.

        :returns: list of INPUTs
        :raises APIError: if some other API error occurred
        """
        url = "{api}/examples/{id}".format(api=api, id=self.id)
        return _api_result(requests.get(url))

    def example_params(self):
        """
        Get example parameters associated with the parametric routine.

        :returns: list of dictionaries, each is a valid set of parameters
        :raises APIError: if some other API error occurred
        """
        url = "{api}/example-params/{id}".format(api=api, id=self.id)
        return _api_result(requests.get(url))

    def gen(self, **kwargs):
        """
        Generate suitable inputs for the routine.

        For information on params, see the routine description. The field
        "count" is always accepted, and specifies the number of inputs to
        generate.

        :param kwargs: generation parameters
        :returns: list of INPUTs
        :raises APIError: if some other API error occurred
        """
        url = "{api}/gen/{id}".format(api=api, id=self.id)
        return _api_result(requests.get(url, params=kwargs))


def find(**kwargs):
    """
    Get a list of routines from the dataset.

    Parameters can be "count" taking a nonnegative number, or
    "depends_on"/"depended_on_by" taking a routine id.

    :param kwargs: find parameters
    :returns: list of Routine
    :raises APIError: if some API error occurred
    """
    url = "{api}/find".format(api=api)
    return [Routine(id) for id in
            _api_result(requests.get(url, params=kwargs))]

