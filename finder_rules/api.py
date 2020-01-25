from django.core.management import call_command
from rest_framework import permissions, status, viewsets
from rest_framework.mixins import CreateModelMixin
from rest_framework.response import Response

from finder_rules.models import Group, Rule, Test

from finder_rules.serializers import GroupSerializer, RuleSerializer, TestSerializer


class RuleViewSet(viewsets.ModelViewSet):
    queryset = Rule.objects.all()
    permission_classes = [permissions.AllowAny]
    serializer_class = RuleSerializer


class GroupViewSet(viewsets.ModelViewSet):
    queryset = Group.objects.all()
    permission_classes = [permissions.AllowAny]
    serializer_class = GroupSerializer


class TestViewSet(viewsets.ModelViewSet):
    permission_classes = [permissions.IsAuthenticated]
    serializer_class = TestSerializer

    def get_queryset(self):
        return self.request.user.tests.all()

    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)

    def create(self, request):
        serializer = TestSerializer(data=request.data)

        if serializer.is_valid():
            test_id = serializer.save().id

            call_command(
                'find_rules',
                serializer.validated_data['group'].id,
                serializer.validated_data['dir_name'],
                test_id
            )

            return Response(serializer.data,
                            status=status.HTTP_201_CREATED,
                            # headers=headers
                            )
        else:
            return Response(serializer.errors,
                            status=status.HTTP_400_BAD_REQUEST,
                            )

        # if(request.data):
        #     call_command(
        #         'find_rules',
        #         request.data['group'],
        #         request.data['dir_name']
        #     )
        # queryset = Test.objects.all()
        # # serializer = TestSerializer(queryset, many=True)
        # return Response(serializer.data)

    # def retrieve(self, request, pk=None):
    #     queryset = Test.objects.all()
    #     test = get_object_or_404(queryset, pk=pk)
    #     serializer = TestSerializer(test)
    #     return Response(serializer.data)
