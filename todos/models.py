from django.db import models

class Todo(models.Model):
    title = models.CharField(max_length=100, verbose_name='Task Title')
    created_at = models.DateTimeField('Created', auto_now_add=True)
    update_at = models.DateTimeField('Updated', auto_now=True)
    isCompleted = models.BooleanField('Completed', default=False)

    def __str__(self):
        return self.title
    
    class Meta:
        ordering = ['-created_at']  # Orders todos by creation date, newest first
        verbose_name = 'Todo'
        verbose_name_plural = 'Todos'

    def get_status(self):
        """Returns the status of the todo item"""
        return "Completed" if self.isCompleted else "Pending"
