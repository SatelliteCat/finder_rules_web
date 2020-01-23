from django.db import models


class Group(models.Model):
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name


class Rule(models.Model):
    name = models.CharField(max_length=255)
    search_text = models.TextField()
    file_types = models.TextField()
    group = models.ForeignKey(Group, on_delete=models.PROTECT)
    recommendation = models.CharField(max_length=255, blank=True)

    def __str__(self):
        return self.name


class Test(models.Model):
    name = models.CharField(max_length=255)
    dir_name = models.CharField(max_length=255)
    group = models.ForeignKey(Group, on_delete=models.PROTECT)
    result = models.TextField(default='')

    def __str__(self):
        return self.name
