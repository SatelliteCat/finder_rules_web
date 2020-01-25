from django.db import models
from django.contrib.auth.models import User


class Group(models.Model):
    name = models.CharField(max_length=255)
    owner = models.ForeignKey(
        User, related_name='group', on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.name


class Rule(models.Model):
    name = models.CharField(max_length=255)
    search_text = models.TextField()
    file_types = models.TextField()
    group = models.ForeignKey(Group, on_delete=models.PROTECT)
    recommendation = models.CharField(max_length=255, blank=True)
    owner = models.ForeignKey(
        User, related_name='rule', on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.name


class Test(models.Model):
    name = models.CharField(max_length=255)
    dir_name = models.CharField(max_length=255)
    group = models.ForeignKey(Group, on_delete=models.PROTECT)
    result = models.TextField(default='')
    owner = models.ForeignKey(
        User, related_name='test', on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.name
