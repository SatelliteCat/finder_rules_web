from django.urls import path
from rest_framework import routers

from finder_rules.api import GroupViewSet, RuleViewSet, TestViewSet

router = routers.DefaultRouter()
router.register('api/rule', RuleViewSet, 'rule')
router.register('api/group', GroupViewSet, 'group')
router.register('api/test', TestViewSet, 'test')

urlpatterns = []

urlpatterns += router.urls
