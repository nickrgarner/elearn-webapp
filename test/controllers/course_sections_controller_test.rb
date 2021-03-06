require 'test_helper'

class CourseSectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_section = course_sections(:one)
  end

  test "should get index" do
    get course_sections_url
    assert_response :success
  end

  test "should get new" do
    get new_course_section_url
    assert_response :success
  end

  test "should create course_section" do
    assert_difference('CourseSection.count') do
      post course_sections_url, params: { course_section: {  } }
    end

    assert_redirected_to course_section_url(CourseSection.last)
  end

  test "should show course_section" do
    get course_section_url(@course_section)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_section_url(@course_section)
    assert_response :success
  end

  test "should update course_section" do
    patch course_section_url(@course_section), params: { course_section: {  } }
    assert_redirected_to course_section_url(@course_section)
  end

  test "should destroy course_section" do
    assert_difference('CourseSection.count', -1) do
      delete course_section_url(@course_section)
    end

    assert_redirected_to course_sections_url
  end
end
