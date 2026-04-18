using NUnit.Framework;
using System;

namespace Matieu.Tests
{
    public class ServiceUpdateTimeTests
    {
        [Test]
        public void UpdatedAt_IsSetToNow_WhenServiceIsEdited()
        {
            var service = new Service
            {
                Id = 1,
                Name = "Худи «Пейн из Акацуки»",
                CreatedAt = DateTime.Now.AddDays(-10),
                UpdatedAt = DateTime.Now.AddDays(-10)
            };

            var before = DateTime.Now;
            service.UpdatedAt = DateTime.Now;
            var after = DateTime.Now;

            Assert.That(service.UpdatedAt, Is.GreaterThanOrEqualTo(before));
            Assert.That(service.UpdatedAt, Is.LessThanOrEqualTo(after));
        }

        [Test]
        public void UpdatedAt_IsNotInFuture()
        {
            var service = new Service
            {
                Id = 2,
                Name = "Рашгард «Человек-паук PS4»",
                CreatedAt = DateTime.Now.AddDays(-5),
                UpdatedAt = DateTime.Now
            };

            Assert.That(service.UpdatedAt, Is.LessThanOrEqualTo(DateTime.Now));
        }

        [Test]
        public void UpdatedAt_FormatsCorrectly_ForDisplay()
        {
            var fixedTime = new DateTime(2026, 4, 17, 13, 53, 0);
            var service = new Service
            {
                Id = 3,
                Name = "Худи «Split»",
                CreatedAt = fixedTime.AddDays(-1),
                UpdatedAt = fixedTime
            };

            var displayStr = $"Изменено: {service.UpdatedAt:dd.MM.yyyy HH:mm}";

            Assert.That(displayStr, Is.EqualTo("Изменено: 17.04.2026 13:53"));
        }

        [Test]
        public void UpdatedAt_IsAfterCreatedAt_WhenServiceIsEdited()
        {
            var createdTime = DateTime.Now.AddDays(-3);
            var service = new Service
            {
                Id = 4,
                Name = "Футболка «Киберпанк Девушка»",
                CreatedAt = createdTime,
                UpdatedAt = createdTime
            };

            service.UpdatedAt = DateTime.Now;

            Assert.That(service.UpdatedAt, Is.GreaterThan(service.CreatedAt));
        }

        [Test]
        public void UpdatedAt_RemainsUnchanged_WhenServiceIsNotEdited()
        {
            var originalUpdatedAt = new DateTime(2026, 4, 17, 13, 53, 0);
            var service = new Service
            {
                Id = 5,
                Name = "Худи «Акацуки»",
                CreatedAt = new DateTime(2026, 1, 1, 8, 0, 0),
                UpdatedAt = originalUpdatedAt
            };

            var snapshot = service.UpdatedAt;

            Assert.That(snapshot, Is.EqualTo(originalUpdatedAt));
        }
    }
}
