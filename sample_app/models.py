from django.db import models


class SampleModel(models.Model):
    modal_name = models.CharField(max_length=50)
