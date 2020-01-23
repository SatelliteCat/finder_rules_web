from django.urls import path
# from finder_rules.views import Index
from rest_framework import routers

from finder_rules import views

from .views import GroupViewSet, RuleViewSet, TestApiViewSet, TestViewSet

router = routers.DefaultRouter()
router.register('api/rule', RuleViewSet, 'rule')
router.register('api/group', GroupViewSet, 'group')
router.register('api/test', TestApiViewSet, 'test')
router.register('api/tast', TestApiViewSet, 'tast')

urlpatterns = [
    # path("", views.home, name="home"),
    # path("rule/", views.rule, name="rule"),
    # path("group/", views.group, name="group"),
    # path("test/", views.test, name="test"),
]

urlpatterns += router.urls
