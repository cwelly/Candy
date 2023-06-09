package com.project.candy.calendar.repository;

import com.project.candy.calendar.dto.ReadCalendarAllResponse;
import com.project.candy.calendar.dto.ReadCalendarResponse;
import com.project.candy.calendar.entity.Calendar;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

/**
 * packageName    : com.project.candy.calendar.repository
 * fileName       : CalendarRepository
 * date           : 2023-03-21
 * description    : 음주 일지(기록)에 대해 RDB와 통신하기 위한 인터페이스
 */
public interface CalendarRepository extends JpaRepository<Calendar, Long> {
  // todo : native query 삭제하는 방식으로 수정
  @Query(nativeQuery = true, value = "select DISTINCT DATE( calendar.created_at ) as createdAt from calendar where calendar.user_id = :userId ")
  Optional<List<ReadCalendarAllResponse>> findAllByUseridWhereYearAndMonth(@Param(value = "userId") long userId);

  Optional<List<Calendar>> findAllByUserId(long userId);
}
