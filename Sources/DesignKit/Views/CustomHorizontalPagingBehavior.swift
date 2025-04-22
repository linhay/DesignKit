//
//  CustomHorizontalPagingBehavior.swift
//  FlowUp
//
//  Created by linhey on 4/19/25.
//

import SwiftUI

struct CustomHorizontalPagingBehavior: ScrollTargetBehavior {
  enum Direction {
    case left, right, none
  }

  func updateTarget(_ target: inout ScrollTarget, context: TargetContext) {
    let scrollViewWidth = context.containerSize.width
    let contentWidth = context.contentSize.width

    // 如果内容宽度小于或等于ScrollView宽度，对齐到最左边位置
    guard contentWidth > scrollViewWidth else {
      target.rect.origin.x = 0
      return
    }

    let originalOffset = context.originalTarget.rect.minX
    let targetOffset = target.rect.minX

    // 通过比较原始偏移量和目标偏移量来确定滚动方向
    let direction: Direction = targetOffset > originalOffset ? .left : (targetOffset < originalOffset ? .right : .none)
    guard direction != .none else {
      target.rect.origin.x = originalOffset
      return
    }

    let thresholdRatio: CGFloat = 1 / 3

    // 根据滚动方向计算剩余内容宽度并确定拖动阈值
    let remaining: CGFloat = direction == .left
      ? (contentWidth - context.originalTarget.rect.maxX)
      : (context.originalTarget.rect.minX)

    let threshold = remaining <= scrollViewWidth ? remaining * thresholdRatio : scrollViewWidth * thresholdRatio

    let dragDistance = originalOffset - targetOffset
    var destination: CGFloat = originalOffset

    if abs(dragDistance) > threshold {
      // 如果拖动距离超过阈值，调整目标到上一页或下一页
      destination = dragDistance > 0 ? originalOffset - scrollViewWidth : originalOffset + scrollViewWidth
    } else {
      // 如果拖动距离在阈值内，根据滚动方向对齐
      if direction == .right {
        // 向右滚动（向左翻页），向上取整
        destination = ceil(originalOffset / scrollViewWidth) * scrollViewWidth
      } else {
        // 向左滚动（向右翻页），向下取整
        destination = floor(originalOffset / scrollViewWidth) * scrollViewWidth
      }
    }

    // 边界处理：确保目标位置在有效范围内并与页面对齐
    let maxOffset = contentWidth - scrollViewWidth
    let boundedDestination = min(max(destination, 0), maxOffset)

    if boundedDestination >= maxOffset * 0.95 {
      // 如果接近末尾，贴合到最后可能的位置
      destination = maxOffset
    } else if boundedDestination <= scrollViewWidth * 0.05 {
      // 如果接近开始，贴合到起始位置
      destination = 0
    } else {
      if direction == .right {
        // 对于从右向左滚动，从右端计算
        let offsetFromRight = maxOffset - boundedDestination
        let pageFromRight = round(offsetFromRight / scrollViewWidth)
        destination = maxOffset - (pageFromRight * scrollViewWidth)
      } else {
        // 对于从左向右滚动，保持原始行为
        let pageNumber = round(boundedDestination / scrollViewWidth)
        destination = min(pageNumber * scrollViewWidth, maxOffset)
      }
    }

    target.rect.origin.x = destination
  }
}
