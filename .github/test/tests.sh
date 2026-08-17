#!/usr/bin/env bash
set -x

cd /openedx/edx-platform

# Create test root folder, required for tests
mkdir -p test_root/log/ test_root/uploads/ test_root/data/

# Test EOL Modifications
DJANGO_SETTINGS_MODULE=lms.envs.test EDXAPP_TEST_MONGO_HOST=mongodb pytest --exitfirst --full-trace --verbose \
    lms/djangoapps/instructor_task/tests/test_tasks_helper.py \
    lms/djangoapps/instructor_analytics/tests/test_basic.py \
    lms/djangoapps/certificates/tests/test_webview_views.py \
    lms/djangoapps/bulk_email/tests/ \
    lms/djangoapps/instructor/tests/ \
    common/djangoapps/util/tests/test_file.py \
    common/djangoapps/util/tests/test_sandboxing.py \
    lms/djangoapps/courseware/tests/test_module_render.py \
    lms/djangoapps/lti_provider/tests/test_signature_validator.py \
    lms/djangoapps/staticbook/tests.py
