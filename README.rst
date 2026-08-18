This is the core repository of the Open edX software. It includes the LMS
(student-facing, delivering courseware), and Studio (course authoring)
components.

Installation
------------

Installing and running an Open edX instance is not simple.  We strongly
recommend that you use a service provider to run the software for you.  They
have free trials that make it easy to get started:
https://openedx.org/get-started/

If you will be modifying edx-platform code, the `Open edX Developer Stack`_ is
a Docker-based development environment.

If you want to run your own Open edX server and have the technical skills to do
so, `Open edX Installation Options`_ explains your options.

.. _Open edX Developer Stack: https://github.com/edx/devstack
.. _Open edX Installation Options:  https://openedx.atlassian.net/wiki/spaces/OpenOPS/pages/60227779/Open+edX+Installation+Options

Security Deployment Requirements
********************************

Some platform features require a **shared** Django cache backend (Redis or
Memcached) to function correctly across multiple LMS nodes:

* **LTI Provider** — OAuth nonce replay protection stores seen nonces in the
  Django ``default`` cache. A per-process backend (e.g. ``LocMemCache``) will
  not detect replays that arrive on a different node. See
  `lms/djangoapps/lti_provider/README.rst`_ for details.

Tutor-based deployments satisfy this requirement automatically. For bare-metal
or custom deployments, verify that ``CACHES['default']`` points at a shared
Redis or Memcached instance before enabling these features.

.. _lms/djangoapps/lti_provider/README.rst: lms/djangoapps/lti_provider/README.rst

License
-------

The code in this repository is licensed under version 3 of the AGPL
unless otherwise noted. Please see the `LICENSE`_ file for details.

.. _LICENSE: https://github.com/edx/edx-platform/blob/master/LICENSE


More about Open edX
-------------------

See the `Open edX site`_ to learn more about the Open edX world. You can find
information about hosting, extending, and contributing to Open edX software. In
addition, the Open edX site provides product announcements, the Open edX blog,
and other rich community resources.

.. _Open edX site: https://openedx.org

Documentation
-------------

Documentation can be found at https://docs.edx.org.


Getting Help
------------

If you're having trouble, we have discussion forums at
https://discuss.openedx.org where you can connect with others in the community.

Our real-time conversations are on Slack. You can request a `Slack
invitation`_, then join our `community Slack team`_.

For more information about these options, see the `Getting Help`_ page.

.. _Slack invitation: https://openedx-slack-invite.herokuapp.com/
.. _community Slack team: http://openedx.slack.com/
.. _Getting Help: https://openedx.org/getting-help


Issue Tracker
-------------

We use JIRA for our issue tracker, not GitHub issues. You can search
`previously reported issues`_.  If you need to report a problem,
please make a free account on our JIRA and `create a new issue`_.

.. _previously reported issues: https://openedx.atlassian.net/projects/CRI/issues
.. _create a new issue: https://openedx.atlassian.net/secure/CreateIssue.jspa?issuetype=1&pid=11900


How to Contribute
-----------------

Contributions are welcome! The first step is to submit a signed
`individual contributor agreement`_.  See our `CONTRIBUTING`_ file for more
information – it also contains guidelines for how to maintain high code
quality, which will make your contribution more likely to be accepted.


Reporting Security Issues
-------------------------

Please do not report security issues in public. Please email
security@edx.org.

.. _individual contributor agreement: https://openedx.org/wp-content/uploads/2019/01/individual-contributor-agreement.pdf
.. _CONTRIBUTING: https://github.com/edx/edx-platform/blob/master/CONTRIBUTING.rst
