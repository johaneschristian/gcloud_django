from django.test import TestCase


class MainTestCase(TestCase):
    def test_one_plus_one_should_equal_two(self):
        one_plus_one = 1 + 1
        self.assertEqual(one_plus_one, 2)
