#!/usr/bin/env bash
set -x

cd /openedx/edx-platform

# Create test root folder, required for tests
mkdir -p test_root/log/ test_root/uploads/ test_root/data/

# Test EOL Modifications
DJANGO_SETTINGS_MODULE=cms.envs.test EDXAPP_TEST_MONGO_HOST=mongodb pytest --exitfirst --full-trace --verbose \
    cms/djangoapps/contentstore/views/tests/test_videos.py \
    cms/djangoapps/contentstore/views/tests/test_import_export.py \
    cms/djangoapps/contentstore/tests/test_import.py \
    common/djangoapps/util/tests/test_file.py \
    common/djangoapps/util/tests/test_sandboxing.py \
    cms/djangoapps/api/v1/tests/test_serializers/test_course_runs.py
